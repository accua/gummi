Rails.application.routes.draw do
  root  'products#welcome'
  resources :products
end
