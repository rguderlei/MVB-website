Mvb::Application.routes.draw do 

  resources :event_locations


  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users

  resources :users
  resources :photos
  resources :galleries
  resources :events, only: [:show, :create, :new, :edit, :update, :destroy]
  resources :concerts
  resources :infos
  resources :pages
  resources :plans
  resources :press_articles

  get "home/index"
  get "admin/index"

  root :to => "home#index"

  get 'static/:permalink', :to => 'pages#show'
  get 'probenplan/:orchestra(.:format)', :to => 'plans#show'

  get 'admin', :to => 'admin#index'

  get '/events(/:year(/:month))', :to => 'events#index', :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
end
