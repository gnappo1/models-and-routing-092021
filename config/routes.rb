Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "/posts", to: "posts#index"
  # get "/posts/:id", to: "posts#show"
  # post "/posts", to: "posts#create"
  # patch "/posts/:id", to: "posts#update"
  # put "/posts/:id", to: "posts#update"
  # delete "/posts/:id", to: "posts#destroy"
  get "/ordered-posts", to: "posts#ordered"
  # "/posts/:id/comments"
  resources :posts do
    # resources :comments, only: [:index, :create]
    resources :comments, shallow: true
  end
  # resources :comments, only: [:show, :update, :destroy]
end
