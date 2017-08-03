Rails.application.routes.draw do


resources :screens

get '/home', to: 'pages#home'

root 'pages#home'

end
