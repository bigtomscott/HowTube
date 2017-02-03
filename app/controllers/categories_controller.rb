class CategoriesController < ApplicationController
  def show
    @posts = Post.where(category_id: params[:id])
  end
end
