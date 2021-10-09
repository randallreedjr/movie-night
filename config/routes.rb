Rails.application.routes.draw do
  root 'movies#index'
  # get 'movies/index'
  # get 'movies/create'
  # get 'movies/destroy'
  resources 'movies', only: [:index, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
