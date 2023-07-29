class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :edit, :update, :destroy]
  def index
    @feeds = current_user.feeds.all
  end

  def new
    @feed = Feed.new
  end

  def create
    @feed = Feed.new(feed_params)
    @feed.unit_price = sprintf("%.2f", @feed.price.to_f / @feed.volume.to_f)
    if @feed.save
      redirect_to feeds_path
    else
      render :new
    end
  end

  def show
    @feed = Feed.find(params[:id])
  end

  def edit
    @feed = Feed.find(params[:id])
  end

  def update
    @feed = Feed.find(params[:id])
    @feed.unit_price = sprintf("%.2f", @feed.volume.to_f / @feed.price.to_f)
    if @feed.update(feed_params)
      redirect_to feed_path
    else
      render :edit
    end
  end

  def destroy
    @feed = Feed.find(params[:id])
    if @feed.destroy
      redirect_to feeds_path
    end
  end

  private

  def set_feed
    @feed = current_user.feeds.find(params[:id])
  end
  
  def feed_params
    params.require(:feed).permit(:name, :price, :volume).merge(user_id: current_user.id)
  end
end
