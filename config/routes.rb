Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  get "/login" => "sessions#new", as: "login"
  delete "/logout" => "sessions#destroy", as: "logout"

  resources :todo_lists do
    resources :todo_items
  end

  root to: "todo_lists#index"
end
