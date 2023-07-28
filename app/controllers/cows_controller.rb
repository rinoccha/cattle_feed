class CowsController < ApplicationController

  def index
    @cows = Cow.order(:position)
  end

  def new
    @cow = Cow.new
  end

  def create
    @cow = Cow.new(cow_params)
    @cow.position = Cow.maximum(:position).to_i + 1
    if @cow.save
      redirect_to cows_path
    else
      render :new
    end
  end

  def show
    @cow = Cow.find(params[:id])
  end

  def edit
    @cow = Cow.find(params[:id])
  end

  def update
    @cow = Cow.find(params[:id])
    if @cow.update(cow_params)
    redirect_to cow_path(@cow.id)
    else
    render :edit
    end
  end

  def destroy
    @cow = Cow.find(params[:id])
    @cow.destroy
    redirect_to root_path
  end

  def feeds
    @cow = Cow.find(params[:id])
    @feeds = @cow.cow_feeds.includes(:feed).map do |cow_feed|
      {
        name: cow_feed.feed.name,
        volume: cow_feed.volume
      }
    end
    render json: @feeds
  end

  def memo
    @cow = Cow.find(params[:id])
    render json: { memo: @cow.memo }
  end

  def update_order
    ActiveRecord::Base.transaction do
      Cow.update_all(position: nil)

      params[:new_order].each_with_index do |id, position|
        Cow.find(id).update!(position: position)
      end
    end
    
    head :ok
  end

  private
  
  def cow_params
    params.require(:cow).permit(:numbers, :birth_day, :memo).merge(user_id: current_user.id)
  end
end
