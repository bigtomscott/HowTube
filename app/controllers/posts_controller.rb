class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :upvote, :downvote]
  def index
    @posts = Post.all.order("created_at DESC").page(params[:page]).per(3)
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path
    else
      render "new"
      flash[:danger] = @post.errors.full_messages.to_sentence
    end
  end

  def upvote
    @post = Post.find(params[:id])
    @post.upvote_by(current_user)
    redirect_to :back
  end

  def downvote
    @post = Post.find(params[:id])
    @post.downvote_by(current_user)
    redirect_to :back
  end

  def search
    if params[:search].blank?
      @posts = Post.all.page(params[:page]).per(3)
    else
      @posts = Post.search(params).page(params[:page]).per(3)
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :category_id)
    end
end
