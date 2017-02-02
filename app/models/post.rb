class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments

  acts_as_votable

  def self.best
    order(cached_votes_score: :desc).limit(5)
  end

  def self.random
    limit(5).order("RANDOM()")
  end

  def self.search(search)
	    where("title ILIKE :search", search: "%#{search}%")
  end

  def split
    if self.body.include?("=")
      self.body.split('=').last if self.body
    else
      self.body.split('/').last if self.body
    end
  end

  def split2
    self.body.split('=').last if self.body
  end
end
