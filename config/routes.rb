Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :rooms do
    resources :message, only: [:create]
  end
  root to: "rooms#index"

end
