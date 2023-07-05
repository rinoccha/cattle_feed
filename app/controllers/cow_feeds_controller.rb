class CowFeedsController < ApplicationController
  def index
    @cow = Cow.find(params[:cow_id])
    @feeds = Feed.all
    @cow_feeds = Cow_feed.all
  end

  def new
    @cow = Cow.find(params[:cow_id])
    @cow_feed = @cow.cow_feeds.new
    @feeds = Feed.all
  end

  def create
    @cow = Cow.find(params[:cow_id])
    @cow_feed = @cow.cow_feeds.new(cow_feed_params)
    
    if @cow_feed.save
      redirect_to @cow, notice: "与える餌の量を追加しました"
    else
      @feeds = Feed.all
      render :new
    end
  end

  def edit
    @cow = Cow.find(params[:id])
    @feeds = Feed.all
    @cow_feed = Cow_feed.find(params[:id])
  end

  def update
    @cow = Cow.find(params[:id])
    @cow_feed = @cow.cow_feeds.find(params[:id])
    if @cow_feed.update(cow_feed_params)
      redirect_to @cow, notice: "餌の情報を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @cow = Cow.find(params[:id])
    @cow_feed = @cow.cow_feeds.find(params[:id])
    if @cow_feed.destroy
      redirect_to @cow, notice: "餌を削除しました"
    else
      render :edit
    end
  end

  private
  def cow_feed_params
    params.require(:cow_feed).permit(:feed_id, :volume)
  end
end
