class CowsController < ApplicationController

  def index
  end

  def new
    @cow = Cow.new
  end

  def create
    Cow.create(cow_params)
  end


  private
  
  def cow_params
    params.require(:cow).permit(:number, :birth_day, :memo).marge(user_id: current_user.id)
  end
end
