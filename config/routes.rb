Rails.application.routes.draw do
  resources :tacos, defaults: {format: :json}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'page#index'

end
