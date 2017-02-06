class API::PostsController < ApplicationController
def index
  @posts = Post.all

  if params[:search]
    @posts = Post.search(params[:search]).first
  end

  render json: @posts

end
end
