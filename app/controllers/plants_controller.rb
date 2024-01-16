class PlantsController < ApplicationController
  before_action :set_plant, only: [:update_date, :show, :edit, :update, :destroy]


  def index
    @plants = current_user.plants
    @today_watering = current_user.plants.where("watering_day = ? OR watering_day < ?", Date.today, Date.today)
    @next_watering = current_user.plants.where("watering_day > ?", Date.today)
    @today_growth = current_user.plants.where(growth_day: Date.today)
    @today_agrochemical = current_user.plants.where(agrochemical_day: Date.today)
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

  def update_date
      if @plant.watering_id == 2
        @plant.update(watering_day: Date.today + 3.days)
      elsif @plant.watering_id == 3
        @plant.update(watering_day: Date.today + 1.day)
      elsif @plant.watering_id == 4
        @plant.update(watering_day: Date.today + 7.days)
      end
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
