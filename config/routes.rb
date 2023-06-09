Rails.application.routes.draw do 
  root "users#home"

  #Home
  get '/home', to: 'users#home', as: 'users_home'

  #Admin
  get '/admin', to: 'admins#admin', as: 'admins_admin'
  get '/admin/view/:id', to: 'admins#user_view', as: 'admins_user_view'
  post '/admin/verify/:id', to: 'admins#user_verify', as: 'admins_user_verify'

  get '/admin/edit/:id', to: 'admins#user_edit', as: 'admins_user_edit'
  patch '/admin/update/:id', to: 'admins#user_update', as: 'admins_user_update'

  post '/admin', to: 'admins#user_sort', as: 'admins_user_sort'
  
  get '/admin/add', to: 'admins#user_add', as: 'admins_user_add'
  post '/admin/add/submit', to: 'admins#user_add_submit', as: 'admins_user_add_submit'


  #Sessions
  get '/signin', to: 'sessions#signin', as: 'sessions_signin'
  post '/signin/authenticate', to: 'sessions#signin_authenticate', as: 'sessions_signin_authenticate'

  get '/logout' , to: 'sessions#logout', as: 'sessions_logout'
  

  get '/signup', to: 'sessions#signup', as: 'sessions_signup'
  post '/signup/submit', to: 'sessions#signup_submit', as: 'sessions_signup_submit'


  #Market 
  get '/market', to: 'trades#market', as: 'market'
  get '/trade', to: 'trades#trade', as: 'trade'
  post '/buy_coin', to: 'trades#buy_coin', as: 'buy_coin'
  post '/sell_coin', to: 'trades#sell_coin', as: 'sell_coin'
  get '/transactions', to: 'trades#transactions', as: 'transactions'


  #Wallet
  get '/new', to: 'wallets#new', as: 'new'
  post '/create', to: 'wallets#create', as: 'create'
  get 'add_balance_form', to: 'wallets#add_balance_form', as: 'add_balance_form'
  get 'subtract_balance_form', to: 'wallets#subtract_balance_form', as: 'subtract_balance_form'
  post '/subtract_balance', to: 'wallets#subtract_balance', as: 'subtract_balance'
  post '/add_balance', to: 'wallets#add_balance', as: 'add_balance'

  #Mailer
  get '/verify_email/:verification_token', to: 'sessions#verify_email', as: 'verify_email'

end
