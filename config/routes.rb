Rails.application.routes.draw do

  get 'screens/index'

  get 'screens/new'

  get 'screens/edit'

  get 'screens/show'

resources :screens

get '/home', to: 'pages#home'

root 'pages#home'

end
