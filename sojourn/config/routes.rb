Sojourn::Application.routes.draw do

 
match 'auth/:provider/callback', to: 'sessions#create'
match 'auth/failure', to: redirect('/')
match 'signout', to: 'sessions#destroy', as: 'signout'

resources :events do
  collection { post :search, to: 'events#index' }
end
  resources :authentications


  resources :statuses


  resources :annoucements


  get "tags/index"
  get "tags/show"
  get "articles/index"
  get "welcome/index"
  get "welcome/contactus"
  get "welcome/aboutus"
  get "welcome/club"
  get "welcome/login"
  get "welcome/holiday"
  
  get "events/index"
  get "articles/index"
  get "welcome/Gallery"
 
	  resources :articles
	  resources :comments
	  resources :tags
	  resources :events
	  resources :annoucements
    resources :authors
    resources :author_sessions, 
                only: [ :new, :create, :destroy ]

                match 'login'  => 'author_sessions#new'
                match 'logout' => 'author_sessions#destroy'


  root :to => 'welcome#index'


   
end
