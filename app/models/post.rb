class Post < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true
  validates :author, presence: true

  has_many :comments

  enum status: %w(draft published)

  def self.draft_posts
    where(status: 0)
  end

  def self.published_posts
    where(status: 1)
  end
end
