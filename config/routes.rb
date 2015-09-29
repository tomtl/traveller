Rails.application.routes.draw do
  root "home#index"

  resources :hotels do
    collection do
      get :search, to: "hotels#search"
      post :search, to: "hotels#results"
    end
  end
end
