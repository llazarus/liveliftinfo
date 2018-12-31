Rails.application.routes.draw do
  get 'about/index'
  devise_for :users
  
  root to: 'lifts#index'

  resources :lifts, only: [ :index ] do
    member do 
      put 'favorite' => 'lifts#favorite_lift'
      put 'alert' => 'lifts#alert_lift'
    end
  end

  resources :about, only: [ :index ]

  resources :webcams, only: [ :index ]
    
  authenticated :user, -> user { user.admin? }  do
    mount DelayedJobWeb, at: "/delayed_job"
  end

end
