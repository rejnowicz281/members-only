Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get 'users/sign_out' => "devise/sessions#destroy"
  end

  resources :posts, only: [:index, :new, :create]

  # Defines the root path route ("/")
  root "posts#index"
end
