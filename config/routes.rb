NestedResources::Application.routes.draw do

	# Listing routes for resources, also limiting routes to only
	# those needed (index, new, create, show)
	# (to support commenting on comments, try) resources :posts, :comments only: [:index, :show, :new, :create] do
	resources :posts, only: [:index, :show, :new, :create, :destroy] do
  	resources :comments, only: [:show, :new, :create]
	end

	# Create a root route as well
  root to: 'posts#index'

  # Routes needed for devise / user authentication
  devise_for :users

end
