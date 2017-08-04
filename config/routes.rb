Rails.application.routes.draw do

resources :screens do
  resources :movies
end

get '/home', to: 'pages#home'

root 'screens#index'

end
