require 'resque/server'
Rails.application.routes.draw do
mount Resque::Server, :at => "/resque"
  devise_for :users
  root 'posts#index'
  resources :posts
 
end
