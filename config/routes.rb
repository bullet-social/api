Rails.application.routes.draw do
  resources :api_keys
  resources :users, param: :username do
		collection do 
			get :current_user
		end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  # sessions
  post '/login', to: "sessions#create"
end
