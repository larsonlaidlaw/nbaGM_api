Rails.application.routes.draw do
  get '/players/free_agents', to: 'players#show_free_agents'
  resources :dead_seasons
  resources :draftpicks
  resources :seasons
  resources :contracts
  resources :players
  resources :teams
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
