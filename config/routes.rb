Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  resources :pokemons

  # make a route to call the function 'capture' in pokemon controller
  patch '/capture', to: 'pokemons#capture'

  patch '/damage', to: 'pokemons#damage'

  patch '/create', to: 'pokemons#create'

  post 'pokemons/new', to: 'pokemons#new'
end
