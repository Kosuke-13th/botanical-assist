class PlantsController < ApplicationController

  def index
    @plants = Plant.includes(:user).order('created_at DESC')
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant =  Plant.create(plant_params)
   if @plant.save
    redirect_to root_path
   else
    render :new, status: :unprocessable_entity
   end
  end

 private

 def plant_params
   params.require(:plant).permit(:plant_name ,:plant_category ,:watering_id ,:growth_time_id ,:agrochemical_time_id ,:image ,:plant_text ,:plant_price).merge(user_id: current_user.id)
 end

end
