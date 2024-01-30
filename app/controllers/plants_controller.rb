class PlantsController < ApplicationController
  before_action :set_plant, only: [:update_date, :update_agrochemical_date, :show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]
  before_action :move_to_index, only: [:show, :edit, :update, :destroy]

  def index
    if user_signed_in?
    @plants = current_user.plants
    @today_watering = current_user.plants.where("watering_day = ? OR watering_day < ?", Date.today, Date.today).order(:watering_day)
    @next_watering = current_user.plants.where("watering_day > ?", Date.today).order(:watering_day)
    @today_agrochemical = current_user.plants.where("agrochemical_day = ? OR agrochemical_day < ?", Date.today, Date.today).order(:agrochemical_day)
    @next_agrochemical = current_user.plants.where("agrochemical_day > ?", Date.today).order(:agrochemical_day)
    @today_growth = current_user.plants.where(growth_day: Date.today)
    else
    end
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

  def update_agrochemical_date
    if @plant.agrochemical_time_id == 2
      @plant.update(agrochemical_day: Date.today + 30.days)
    elsif @plant.agrochemical_time_id == 3
      @plant.update(agrochemical_day: Date.today + 90.days)
    elsif @plant.agrochemical_time_id == 4
      if Date.today.month >= 12 || (Date.today.month >= 1 && Date.today.month <= 5)
        @plant.update(agrochemical_day: Date.new(Date.today.year, 3, 1))
      elsif Date.today.month >= 6 && Date.today.month <= 11
        @plant.update(agrochemical_day: Date.new(Date.today.year, 9, 1))
      end
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

  def move_to_index
    return if current_user.id == @plant.user_id
    redirect_to action: :index
  end

end
