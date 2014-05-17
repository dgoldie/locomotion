Locomotion::Application.routes.draw do
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users

  get 'auth/:id', to: 'auth#show'
  get 'auth/moves/callback', to: 'auth#callback'

  get 'tracker', to: 'tracker#index'
  get 'tracker/logout', to: 'tracker#logout'
  get 'tracker/profile', to: 'tracker#profile'
  get 'tracker/signin', to: 'tracker#signin'
  get 'tracker/recent', to: 'tracker#recent'



end
