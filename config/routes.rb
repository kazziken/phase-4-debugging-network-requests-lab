Rails.application.routes.draw do
  resources :toys, only: [:index, :create, :update, :destroy]
  get 'toys/:id/likes', to: 'toys#increase_likes'
end
