Rails.application.routes.draw do
  devise_for :users
  
  root to: 'lifts#index'

  resources :lifts, only: [ :index ] do
    member do 
      put 'favorite' => 'lifts#favorite'
      put 'alert' => 'lifts#alert'
    end
  end

end
