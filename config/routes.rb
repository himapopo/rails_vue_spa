Rails.application.routes.draw do
  resources :users, only: %i[index destroy create update show] 
  post '/sign_in' => 'users#sign_in'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
