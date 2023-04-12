Rails.application.routes.draw do 
  root "users#home"
  get '/home', to: 'users#home', as: 'home'
  get '/signup', to: 'users#signup', as: 'signup'
  post '/create', to: 'users#create', as: 'create'

  get '/market', to: 'trades#market', as: 'market'
  get '/trade', to: 'trades#trade', as: 'trade'
  post '/execute', to: 'trades#execute', as: 'execute'

end
