class CowFeedsController < ApplicationController
  def index
    @cow = current_user.cows.find(params[:cow_id])
    @feeds = Feed.all
    @cow_feeds = Cow_feed.all
  end

  def new
    @cow = current_user.cows.find(params[:cow_id])
    @cow_feed = @cow.cow_feeds.new
    @feeds = current_user.feeds.all
  end

  def create
    @cow = current_user.cows.find(params[:cow_id])
    @cow_feed = @cow.cow_feeds.new(cow_feed_params)
    
    if @cow_feed.save
      redirect_to @cow, notice: "与える餌の量を追加しました"
    else
      @feeds = Feed.all
      render :new
    end
  end

  def edit
    @cow = current_user.cows.find(params[:cow_id])
    @feeds = current_user.feeds.all
    @cow_feed = @cow.cow_feeds
  end

  def update
    @cow = current_user.cows.find(params[:cow_id])
    @cow_feed = @cow.cow_feeds.find(params[:id])
    if @cow_feed.update(cow_feed_params)
      new_price = @cow_feed.feed.unit_price * @cow_feed.volume
      render json: {volume: @cow_feed.volume, price: new_price}
    else
      render json: { error: '更新に失敗しました'}, status: 400
    end
  end

  def destroy
    @cow = current_user.cows.find(params[:cow_id])
    @cow_feed = @cow.cow_feeds.find(params[:id])
    if @cow_feed.destroy
      render :edit, notice: "餌を削除しました"
    else
      render :edit
    end
  end

  private
  def cow_feed_params
    params.require(:cow_feed).permit(:feed_id, :volume)
  end
end
