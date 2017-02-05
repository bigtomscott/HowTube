Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    resources :posts, only: [:index]
  end

  resources :posts do
    member do
      put :like, to: "posts#upvote"
      put :dislike, to: "posts#downvote"
    end

    collection do
      get :search
    end
  end

  root "homes#index"

  get "/topposts", to: "pages#topposts", as: "topposts"
  get "/randomposts", to: "pages#randomposts", as: "randomposts"
  get "/category/:id", to: "categories#show", as: "category"
  get "/slackposts", to: "pages#slackposts", as: "slackposts" do
    content_type :json
    {:text => params[:text],:response_type => "in_channel"}.to_json}
  end

end
