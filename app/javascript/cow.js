document.addEventListener('turbolinks:load', function(){
  const middleContents = document.getElementById("middle-contents");
  const cowNumberDisplay = document.querySelector('.cow-p');
  const feedListDisplay = document.querySelector('.feeds-list');
  const memoDisplay = document.querySelector('.memo-p');
  const detailLink = document.getElementById('detail-link');

  if(middleContents && cowNumberDisplay && feedListDisplay && detailLink){
    const cows = document.querySelectorAll('.cow');
    cows.forEach(function(button){
    button.addEventListener('click', function(event){
      const cowNumber = this.getAttribute('data-number');
      const cowId = this.getAttribute('data-id');
      cowNumberDisplay.textContent = cowNumber
      detailLink.href = `/cows/${cowId}`;

      fetch(`/cows/${cowId}/feeds`)
        .then(response => response.json())
        .then(data => {
          feedListDisplay.innerHTML = data.map(feed => {
            return `<p class="feed-p">${feed.name}<span> ${feed.volume}kg</span></p>`;
          }).join('');
        });

        fetch(`/cows/${cowId}/memo`)
          .then(response => response.json())
          .then(data => {
            memoDisplay.innerHTML = `<p class="memo-p">${data.memo}</p>`;
          });

      middleContents.classList.remove('hidden');
      event.stopPropagation();
    })
    });

    document.addEventListener('click', function(){
      middleContents.classList.add('hidden');
    });

    middleContents.addEventListener('click', function(event){
      event.stopPropagation();
    });

    let cowList = Array.from(document.querySelectorAll('.cow'));
    let cowsArray = cowList.map(cow => cow.getAttribute('data-id'));
    cowList.forEach((cow, index) => {
      cow.style.order = index;

      cow.addEventListener('dragstart', (event) =>{
        const cowId = cow.getAttribute('data-id');
        event.dataTransfer.setData('text/plain', cowId);
      });

      cow.addEventListener('dragover', (event) => {
        event.preventDefault();
      });

      cow.addEventListener('drop', (event) => {
        event.preventDefault();
        const draggedId = event.dataTransfer.getData('text/plain');
        const draggedElement = document.getElementById(draggedId);
        const dropzone = event.target.closest('.cow');

        if (draggedElement && dropzone) {
          const dropzoneParent = dropzone.parentElement;
          const draggedOrder = Array .from (dropzoneParent .children).indexOf(draggedElement);
          const dropzoneOrder = Array.from(dropzoneParent.children).indexOf(dropzone);

          if (draggedOrder < dropzoneOrder) {
            dropzoneParent.insertBefore(draggedElement, dropzone.nextSibling);
          } else {
            dropzoneParent.insertBefore(draggedElement, dropzone);
          }
          
          setTimeout(() => {
            draggedElement.style.order = dropzoneOrder;
            dropzone.style.order = draggedOrder;
          }, 1);
        }
      });
     

      cow.addEventListener('dragend', () => {
        setTimeout(() => {
        let reorderedCows = Array.from(document.querySelectorAll('.cow'));
        let newOrder = reorderedCows.map(cow => cow.getAttribute('data-id'));

        if (JSON.stringify(newOrder) !== JSON.stringify(cowsArray)){
          fetch('/cows/update_order', {
            method: 'PATCH',
            headers: {
              'Content-Type': 'application/json',
              'X-CSRF-Token': document.querySelector("meta[name='csrf-token']").content
            },
            body: JSON.stringify({
              new_order: newOrder,
            }),
          }).then(response => {
            if (!response.ok) {
              throw new Error('Network response was not ok');
            }
          }).then(data => {
            cowsArray = newOrder;
          }).catch((error) => {
            console.log('Error:', error);
          });
        }
        }, 1);
      });
    });
  }
});