Rails.application.routes.draw do
  devise_for :users
  root to: "memos#index"
  resources :rooms, only: [:new, :create]
end
