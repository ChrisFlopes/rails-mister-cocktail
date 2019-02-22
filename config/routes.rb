Rails.application.routes.draw do
  root to: 'homepage#index'
  resources :cocktails, except: %i[destroy edit update] do
    resources :doses, only: %i[new create]
  end
  resources :doses, only: [:destroy]
end
