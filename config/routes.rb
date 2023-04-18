Rails.application.routes.draw do 
  root "users#home"

  #home
  get '/home', to: 'users#home', as: 'home'

  #Sessions
  get '/signin', to: 'sessions#signin', as: 'sessions_signin'
  post '/signin/authenticate', to: 'sessions#signin_authenticate', as: 'sessions_signin_authenticate'

  get '/signup', to: 'sessions#signup', as: 'sessions_signup'
  post '/signup/submit', to: 'sessions#signup_submit', as: 'sessions_signup_submit'


  get '/market', to: 'trades#market', as: 'market'
  get '/trade', to: 'trades#trade', as: 'trade'
  post '/execute', to: 'trades#execute', as: 'execute'

  get '/new', to: 'wallets#new', as: 'new'
  post '/create', to: 'wallets#create', as: 'create'
  get 'add_balance_form', to: 'wallets#add_balance_form', as: 'add_balance_form'
  get 'subtract_balance_form', to: 'wallets#subtract_balance_form', as: 'subtract_balance_form'
  post '/subtract_balance', to: 'wallets#subtract_balance', as: 'subtract_balance'
  post '/add_balance', to: 'wallets#add_balance', as: 'add_balance'


end
