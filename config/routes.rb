Rails.application.routes.draw do
  resources :cocktails, except: %i[destroy edit update] do
    resources :doses, only: %i[new create]
  end
  resources :doses, only: [:destroy]
end
