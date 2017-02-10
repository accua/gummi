Rails.application.routes.draw do
  root  'products#welcome'
  resources :products, except: [:new, :edit]
end
