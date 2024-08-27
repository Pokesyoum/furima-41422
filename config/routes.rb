Rails.application.routes.draw do
  root "items#index"
  resources :item, only: :index
end
