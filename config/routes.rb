Rails.application.routes.draw do
  resources :plans
	resources :tasks
	resources :completions
	root to: "plans#index"
	get 'users/new' => 'users#new', as: :new_user
	post 'users' => 'users#create'
  get '/login' => 'sessions#new'
	post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
	delete '/completions' => 'completions#destroy'
end
