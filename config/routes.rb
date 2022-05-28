Rails.application.routes.draw do
	root to: 'users#new'
	get 'users/new' => 'users#new', as: :new_user
	post 'users' => 'users#create'
end