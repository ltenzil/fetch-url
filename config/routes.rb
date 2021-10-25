Rails.application.routes.draw do
  root 'fetch_url#index', as: "fetch_urls"
  get 'fetch_urls', to: 'fetch_url#index'
  get 'fetch_urls/search', to: 'fetch_url#show', as: 'search'
  post 'fetch_urls/search', to: 'fetch_url#show'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
