class PlantsController < ApplicationController

  def index
    @plants = Plant.includes(:user).order("created_at DESC")
    @today_watering = Plant.where(watering_day: Date.today)
    @today_growth = Plant.where(growth_day: Date.today)
    @today_agrochemical = Plant.where(agrochemical_day: Date.today)
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
  params.require(:plant).permit(:plant_name ,:plant_category ,:watering_id ,:watering_day ,:growth_time_id ,:growth_day ,:agrochemical_time_id ,:agrochemical_day ,:image ,:plant_text ,:start_time ,:plant_price).merge(user_id: current_user.id)
 end


end
