Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "/posts", to: "posts#index"
  # get "/posts/:id", to: "posts#show"
  # post "/posts", to: "posts#create"
  # patch "/posts/:id", to: "posts#update"
  # put "/posts/:id", to: "posts#update"
  # delete "/posts/:id", to: "posts#destroy"
  scope :api do
    scope :v1 do
      get "/ordered-posts", to: "posts#ordered"
      get "/most-comments", to: "posts#most_comments"

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
