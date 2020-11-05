Rails.application.routes.draw do
	root 'welcome#index'
  resources :cash_managements do 
  	collection do
      get 'filter_cash_management'
    end
  end
  resources :companies
  devise_for :users
  resources :welcome, only: [:index]
end
