Rails.application.routes.draw do
  root "home#index"
  
  resources :exercises do
    member do
      post :toggle_completion
    end
  end
end
