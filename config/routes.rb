Rails.application.routes.draw do
	root 'sessions#new'

  get '/sign_in',  to: "sessions#new"
  post '/sign_in', to: "sessions#create"

  resources :users, 	 only: [:new, :create, :show]
  resources :events,	 only: [:index, :new, :create, :show]
end
