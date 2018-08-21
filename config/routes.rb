Rails.application.routes.draw do
  get 'dashboard', to: 'dashboard#show'

  get 'auth/developer', :as => 'developer_auth'
  get 'auth/github', :as => 'github_auth'
  match 'auth/:provider/callback' => 'session#create', :via => [:get, :post]

  get 'session/destroy', :as => 'logout'

  root "home#index"
end
