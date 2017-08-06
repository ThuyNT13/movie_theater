Rails.application.routes.draw do

get '/signup', to: 'users#new'
post '/signup', to: 'users#create'

resources :users, except: [:index, :new, :create]

resources :screens do
  resources :movies
end

# get '/home', to: 'pages#home'

# root 'pages#home'
root 'screens#index'

end
