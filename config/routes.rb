Rails.application.routes.draw do
  root "home#index"

  get "/login", to: "sessions#new", as: :login
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: :logout

  resources :users, only: %i[new create]

  resources :exercises do
    member do
      post :toggle_completion
    end
  end
end
