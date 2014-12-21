Rails.application.routes.draw do
  resources :feeds do
    resources :items
  end
  root 'feeds#index'
end
