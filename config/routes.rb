Rails.application.routes.draw do

  root "pages#home"
  devise_for :users

  resources :categories, except: [:show] do
    resources :services, except: [:show] do
      resources :addons, except: [:show]
      resources :schedules, except: [:index, :show] do
        resources :timeslots, except: [:index, :show]
      end
    end
  end

  resources :users, only: [:index] do
    resources :payment_options, only: [:new, :create, :destroy]
  end

  resources :bookings, except: [:new, :edit]

  # admin overview(dashboard)
  get "/overview", to: "pages#overview", as: "overview"

  # all services
  get "/services", to: "services#all", as: "services"
  
end
