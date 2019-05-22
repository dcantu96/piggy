Rails.application.routes.draw do
  devise_for :users
  resources :goals do
    resources :incomes
  end
  resources :accounts, only: [:show, :edit, :update] do
    resources :incomes, controller: 'account_incomes'
    resources :expenses
  end
  resources :categories
  resources :profile, only: [:show]
  root to: 'dashboard#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
