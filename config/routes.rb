PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'


  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  resources :posts, except: :destroy do
    resources :comments, only: [:create]
  end
  resources :categories, except: :destroy

  resources :users, only: [:edit, :show, :update]

end
