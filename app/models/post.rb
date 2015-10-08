class Post < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true
  validates :author, presence: true

  enum status: %w(draft published)
end
