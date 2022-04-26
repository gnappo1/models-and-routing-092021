Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "/posts", to: "posts#index"
  # get "/posts/:id", to: "posts#show"
  # post "/posts", to: "posts#create"
  # patch "/posts/:id", to: "posts#update"
  # put "/posts/:id", to: "posts#update"
  # delete "/posts/:id", to: "posts#destroy"
  get '/auth/:provider/callback', to: "sessions#omniauth"
  scope :api do
    scope :v1 do
      get "/ordered-posts", to: "posts#ordered"
      get "/most-comments", to: "posts#most_comments"
      
      resources :users, only: [:update, :destroy]
      post "/signup", to: "users#create" 
      get "/me", to: "users#show"
      post "/login", to: "sessions#create"
      delete "/logout", to: "sessions#destroy"

      # get "/comments", to: "comments#index"
      resources :comments, only: [:index]
      # "/posts/:id/comments"
      resources :posts do
        # resources :comments, only: [:index, :create]
        resources :comments, shallow: true
      end
    end
  end

  
end
