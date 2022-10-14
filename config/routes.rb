Rails.application.routes.draw do

  root "pages#home"
  devise_for :users

  resources :categories, except: [:show] do
    resources :services, except: [:show] do      
      resources :addons, except: [:show]
      resources :bookings, only: [:new]
      resources :schedules, except: [:index, :show] do
        resources :timeslots, except: [:index, :show]
      end
    end
  end

  resources :users, only: [:index] do
    resources :payment_options, only: [:index, :new, :create, :destroy]
  end

  resources :bookings, only: [:index, :show]

  # admin overview(dashboard)
  get "/overview", to: "pages#overview", as: "overview"

  # booking confirmation
  get "/booking/confirmation", to: "bookings#confirmation", as: "booking_confirm"

  # booking create
  post "/booking/confirmation", to: "bookings#create"

  # booking cancel
  patch "/booking/:booking_id/cancel", to: "bookings#cancel", as: "booking_cancel"

  # booking complete
  patch "/booking/:booking_id/complete", to: "bookings#complete", as: "booking_complete"

  # all services
  get "/services", to: "services#all", as: "services"
  
end
