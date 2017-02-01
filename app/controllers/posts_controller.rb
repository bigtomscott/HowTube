class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :upvote, :downvote]
  def index
    @posts = Post.all.order("created_at DESC").page(params[:page]).per(5)
    @post = Post.new

    if params[:search]
      @posts = Post.search(params[:search]).order(:cached_votes_score => :desc)
      if @posts.empty?
        flash[:notice] = "There are no tutorials matching your search"
      end
    end
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
      redirect_to @post
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

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
