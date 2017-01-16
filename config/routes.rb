Rails.application.routes.draw do

    root to: 'pages#home'

  resources :portfolios, except: [:show]
  get 'angular-items', to: 'portfolios#angular'
  get 'portfolio/:id', to: "portfolios#show", as: 'portfolio_show'
  
  get 'about' , to: "pages#about"
  get 'contact', to: 'pages#contact'

  resources :blogs do
    member do
        get :toggle_status
    end
end
  
end
