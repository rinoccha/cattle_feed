function updateTotals(){
  let totalVolume = 0;
  let totalPrice = 0;
  const rows = document.querySelectorAll('.feed-list tr');
  rows.forEach(row => {
    if (row.dataset.cowFeedId){
      const volumeText = row.querySelector('td:nth-child(2)').innerText;
      const volume = parseInt(volumeText);
      totalVolume += volume;

      const priceText = row.querySelector('td:nth-child(3)').innerText;
      const price = parseInt(priceText);
      totalPrice += price;
    }
  });
  const totalRow = document.querySelector('#total-row');
  totalRow.querySelector('td:nth-child(2)').innerText = `${totalVolume}kg`;
  totalRow.querySelector('td:nth-child(3)').innerText = `${totalPrice}円`;
}

function addEditEventListener(button) {
  button.addEventListener('click', function(event){
    event.preventDefault();
    const row = event.target.closest('tr');
    const feedName = row.querySelector('td:nth-child(1)').innerText;
    const feedVolume = row.querySelector('td:nth-child(2)').innerText;

    let formHtml = `
      <form class="edit-feed-form">
        <input type="text" name="feed-volume" class="feed-volume-input" value="${feedVolume}"></input>
        <button type="button" class="submit-edit">保存</button>
      </form>`;

    row.innerHTML = formHtml;

    const submitButton = row.querySelector('.submit-edit');
    submitButton.addEventListener('click', function(event){
      event.preventDefault();
      const editedVolume = row.querySelector('.feed-volume-input').value;

      const data = {
        cow_feed: {
          volume: editedVolume,
        }
      };

      const cowId = row.dataset.cowId;
      const cowFeedId = row.dataset.cowFeedId
      const url = `/cows/${cowId}/cow_feeds/${cowFeedId}`;
      const xhr = new XMLHttpRequest();
      const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
      xhr.open('PATCH', url, true);
      xhr.setRequestHeader('X-CSRF-Token', token);
      xhr.setRequestHeader('Content-Type', 'application/json');
      xhr.onload = function(){
        if (xhr.status === 200){
          const updatedData = JSON.parse(xhr.responseText);
          const updatedRowHtml = `
              <tr>
                <td>${feedName}</td>
                <td>${updatedData.volume}kg</td>
                <td>${updatedData.price}円</td>
                <td>
                  <button class="edit-feed">量の編集</button>
                  <button class="delete-feed">削除</button>
                </td>
              </tr>`;
          row.innerHTML = updatedRowHtml;
          const updatedDeleteButton = row.querySelector('.delete-feed');
          addDeleteEventListener(updatedDeleteButton);
          const updatedEditButton = row.querySelector('.edit-feed');
          addEditEventListener(updatedEditButton);
          updateTotals();
        }else{
          console.error(xhr.statusText);
        }
      };

      xhr.send(JSON.stringify(data));
    });
  });
}

function addDeleteEventListener(button) {
  button.addEventListener('click', function(event){
    event.preventDefault();
    const row = event.target.closest('tr');
    const confirmation = confirm('本当に削除しますか？');
    if (confirmation){
      const cowId = row.dataset.cowId;
      const cowFeedId = row.dataset.cowFeedId
      const url = `/cows/${cowId}/cow_feeds/${cowFeedId}`;
      const xhr = new XMLHttpRequest();
      xhr.open('DELETE', url, true);

      xhr.onload = function(){
        if (xhr.status === 200){
          row.remove();
          updateTotals();
        }else{
          console.error(xhr.statusText);
        }
      };

      xhr.send();
    }
  })
}

document.addEventListener('DOMContentLoaded', function(){
  const editButtons = document.querySelectorAll('.edit-feed');
  const deleteButtons = document.querySelectorAll('.delete-feed');

  editButtons.forEach(addEditEventListener);
  deleteButtons.forEach(addDeleteEventListener);

});