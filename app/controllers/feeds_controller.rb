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
  end


  private
  
  def feed_params
    params.require(:feed).permit(:name, :price, :volume).merge(user_id: current_user.id)
  end
end
