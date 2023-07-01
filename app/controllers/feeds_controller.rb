class FeedsController < ApplicationController
  def index
    @feeds = Feed.all
  end

  def new
    @feed = Feed.new
  end

  def create
    @feed = Feed.new(feed_params)
    if @feed.save
      redirect_to feeds_path
    else
      render :new
    end
  end

  def show
    @feed = Feed.find(params[:id])
    @price = sprintf("%.1f",@feed.price / @feed.volume.to_f)
  end

  def edit
    @feed = Feed.find(params[:id])
  end

  def update
    @feed = Feed.find(params[:id])
    if @feed.update(feed_params)
      redirect_to feed_path
    else
      render :edit
    end
  end

  private
  
  def feed_params
    params.require(:feed).permit(:name, :price, :volume).merge(user_id: current_user.id)
  end
end
