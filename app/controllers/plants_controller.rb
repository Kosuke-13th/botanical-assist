class PlantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_plant, only: [:show, :edit, :update, :destroy]


  def index
    @plants = Plant.includes(:user).order("created_at DESC")
    @today_watering = Plant.where(watering_day: Date.today)
    @next_watering = Plant.where.not(watering_day: Date.today)
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

  def show
  end

  def edit
  end

  def update
   if @plant.update(plant_params)
    redirect_to root_path
   else
    render :edit, status: :unprocessable_entity
   end
  end

  def destroy
    @plant.destroy
    redirect_to root_path
  end

  private

 def plant_params
  params.require(:plant).permit(:plant_name ,:plant_category ,:watering_id ,:watering_day ,:growth_time_id ,:growth_day ,:agrochemical_time_id ,:agrochemical_day ,:image ,:plant_text ,:start_time ,:plant_price).merge(user_id: current_user.id)
 end

 def set_plant
  @plant = Plant.find(params[:id])
end


end
