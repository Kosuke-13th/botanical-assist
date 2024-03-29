Rails.application.routes.draw do
  devise_for :users

  root to: "plants#index"
  resources :plants do
    member do
    post 'update_date'
    post 'update_agrochemical_date'
    end
  end

  resources :users, only: :show
end