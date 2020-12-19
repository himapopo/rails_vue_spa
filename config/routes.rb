Rails.application.routes.draw do
  resource :likes, only: %i[create destroy]
  resources :birds, only: %i[index destroy show update create]
  resources :users, only: %i[index destroy create update show] do
    
    resources :likes, only: :index , controller: :users, action: :likes
    resources :birds ,only: :index , controller: :users, action: :birds
  end
  post '/sign_in' => 'users#sign_in'
  get '/sign_out' => 'users#sign_out' 
  post '/users/imagechange/:id' => 'users#imagechange'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
