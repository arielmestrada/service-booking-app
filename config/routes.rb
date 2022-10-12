Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "pages#home"

  resources :categories, except: [:show] do
    resources :services, except: [:show] do
      resources :addons, except: [:show]
      resources :schedules, except: [:index, :show] do
        resources :timeslots, except: [:index, :show]
      end
    end
  end
  
end
