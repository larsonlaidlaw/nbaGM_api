Rails.application.routes.draw do
  resources :dead_seasons
  resources :draftpicks
  resources :seasons
  resources :contracts
  resources :players
  resources :teams
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
