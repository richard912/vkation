Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: {format: :json} do
    scope module: :v1 do
    	as :user do
          resources :users, :except => [:create, :new, :edit, :show] do
            collection do
              post '/authenticate' => 'sessions#create'
              post '/register' => 'users#create'
              delete '/logout' => 'sessions#destroy'
              post '/forgot_password' => 'users#forgot_password'
              post '/reset_password' => 'users#reset_password'
              get '/email_exists' => 'users#email_exists'
              post '/reset_passowrd_email' => 'users#reset_passowrd_email'
              post '/forgot_password' => 'users#forgot_password'
              post '/reset_password' => 'users#reset_password'
              get '/check_user' => 'users#check_user'
          end
        end
      end
      resources :places, :only => [:index] do 
        member do
          resources :attractions, :only => [:index]
        end
      end
      resources :transports, :only => [:index]
      resources :budgets, :only => [:index]
      resources :stay_types, :only => [:index]
      resources :categories, :only => [:index] do 
        collection do 
          get '/get_amenities' => 'categories#get_amenities'
        end
      end
      resources :hotels, :only => [:search, :show] do
        collection do
          post '/search' => 'hotels#search'
        end
      end
      resources :auths, :only => [:authenticate] do
        collection do
          post '/facebook' => 'auths#authenticate'
          post '/payment' => 'auths#payment_test'
        end
      end
      resources :bookings
    end
  end
  root 'index#index'
end
