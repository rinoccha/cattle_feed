class FeedsController < ApplicationController
  def index
    @feeds = Feed.all
  end

  def new
    @feed = Feed.new
  end

  def create
    if Feed.create(feed_params)
      redirect_to feeds_path
    else
      render :new
    end
  end


  private
  
  def feed_params
    params.require(:feed).permit(:name, :price, :volume).merge(user_id: current_user.id)
  end
end
