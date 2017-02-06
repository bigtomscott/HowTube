class PagesController < ApplicationController

  def topposts
    @posts = Post.best
  end

  def randomposts
    @posts = Post.random
  end

end
