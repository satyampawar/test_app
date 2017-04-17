Rails.application.routes.draw do
  

  resources :payments
  devise_for :users, controllers: {registrations: 'registrations',:omniauth_callbacks => "callbacks"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
end
