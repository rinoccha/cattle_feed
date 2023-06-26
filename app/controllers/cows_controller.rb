class CowsController < ApplicationController

  def index
    @cows = Cow.all
  end

  def new
    @cow = Cow.new
  end

  def create
    if Cow.create(cow_params)
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
    Cow.update(cow_params)
  end

  private
  
  def cow_params
    params.require(:cow).permit(:numbers, :birth_day, :memo).merge(user_id: current_user.id)
  end
end
