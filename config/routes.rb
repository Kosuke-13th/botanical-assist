Rails.application.routes.draw do
 devise_for :users

 root to: "plants#index"
 resources :plants 

 post '/update_watering_day', to: 'watering#update_watering_day', as: 'update_watering_day'
 
 def update_watering_day
  if @today_watering.update(watering_day: @today_watering.watering_day + 3.days)
    render json: { status: 'success' }
  else
    render json: { status: 'error' }
  end
 end
end
