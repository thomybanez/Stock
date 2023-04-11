Rails.application.routes.draw do 
  root "users#home"
  get 'home', to: 'users#home', as: 'home'
  get 'signup', to: 'users#signup', as: 'signup'
  post 'signup', to: 'users#create', as: 'create'
end
