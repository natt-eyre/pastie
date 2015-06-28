Rails.application.routes.draw do
  root to: "pastes#new"
  resources :pastes, only: [:create, :show]
end
