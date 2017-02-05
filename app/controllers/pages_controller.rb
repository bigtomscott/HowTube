class PagesController < ApplicationController

  def topposts
    @posts = Post.best
  end

  def randomposts
    @posts = Post.random
  end

  def slackposts
    @posts = Post.slack.order(cached_votes_score: :desc).first
  end

end
