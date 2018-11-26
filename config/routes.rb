Rails.application.routes.draw do
  devise_for :users
  root to: 'lifts#index'
end
