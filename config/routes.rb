Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :todolists do
    resources :tasks
  end

  root 'todolists#index'
end
