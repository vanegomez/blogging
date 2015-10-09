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

  def published?
    status == "published"
  end

  def self.by_title
    pluck(:title).sort
  end

  def self.by_author
    pluck(:author).sort.uniq.sort.map do |author|
      author.capitalize
    end
  end
end
