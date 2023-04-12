Rails.application.routes.draw do 
  root "users#home"


  #Sessions
  get '/signin', to: 'sessions#signin', as: 'sessions_signin'
  post '/signin/authenticate', to: 'sessions#signin_authenticate', as: 'sessions_signin_authenticate'

  get '/signup', to: 'sessions#signup', as: 'sessions_signup'
  post '/signup/submit', to: 'sessions#signup_submit', as: 'sessions_signup_submit'


  get '/market', to: 'trades#market', as: 'market'
  get '/trade', to: 'trades#trade', as: 'trade'
  post '/execute', to: 'trades#execute', as: 'execute'

end
