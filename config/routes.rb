Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :rooms do
    resources :messages, only: [:create]
  end
  root to: "rooms#index"
  delete "/rooms/:room_id/messages/:id(.:format)", to: 'messages#destroy', as: 'messages_destroy'
end
