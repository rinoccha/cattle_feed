class CowsController < ApplicationController

  def index
    @cows = Cow.all
  end

  def new
    @cow = Cow.new
  end

  def create
    @cow = Cow.new(cow_params)
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

  private
  
  def cow_params
    params.require(:cow).permit(:numbers, :birth_day, :memo).merge(user_id: current_user.id)
  end
end
