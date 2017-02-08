class CategoriesController < ApplicationController
  def show
    @posts = Post.where(category_id: params[:id]).all.page(params[:page]).per(3)
  end
end
