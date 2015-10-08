class Comment < ActiveRecord::Base
  belongs_to :post

  validates :author, presence: true
  validates :body, presence: true
  validates :post_id, presence: true
end
