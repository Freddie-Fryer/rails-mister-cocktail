Rails.application.routes.draw do
  get 'ingredients/new'
  get 'ingredients/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'cocktails#home'

  resources :ingredients, only: [ :create, :show ]

  resources :cocktails, only: [ :new, :create, :show, :destroy, :index ] do
    resources :doses, only: [ :new, :create ]
  end
  resources :doses, only: [ :destroy ]
end
