Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  post "/graphql", to: "graphql#execute"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  namespace :admin do
    root to: "dashboard#index"
    resources :action_items, only: [:index, :create, :new, :destroy]
    resources :users, only: [:index]

  end

  get '*path', to: 'home#index' # TODO: Make specific routes for client

end
