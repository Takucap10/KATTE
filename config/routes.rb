Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :rooms do
    resources :memos
  end
end
