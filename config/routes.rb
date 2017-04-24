Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  namespace :api do
    post "/graphql", to: "graphql#execute"
    post "/login", to: "sessions#login"
    post "/signup", to: "sessions#signup"
  end

  namespace :admin do
    root to: "dashboard#index"
    resources :action_items, only: [:index, :create, :new, :destroy]
    resources :users, only: [:index]
  end

  if Rails.env.development?
    # For testing graphql endpoints in development
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/api/graphql"
  end

end
