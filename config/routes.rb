Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    member do
      put :like, to: "posts#upvote"
      put :dislike, to: "posts#downvote"
    end

    collection do
      get :search
    end
  end

  resources :slackresponses, only: :create

  root "homes#index"

  get "/topposts", to: "pages#topposts", as: "topposts"
  get "/randomposts", to: "pages#randomposts", as: "randomposts"
  get "/category/:id", to: "categories#show", as: "category"

end
