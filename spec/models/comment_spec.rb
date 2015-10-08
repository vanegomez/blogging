require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:post) { Post.create(title: "Title", body: "Body", author: "me") }
  let(:comment) { Comment.create(author: "me", body: "Body", post_id: post.id) }

  it 'is valid' do
    expect(comment).to be_valid
  end

  it 'is invalid without an author' do
    comment.author = nil
    expect(comment).to_not be_valid
  end

  it 'is invalid without a body' do
    comment.body = nil
    expect(comment).to_not be_valid
  end

  it 'is invalid without a post id' do
    comment.post_id = nil
    expect(comment).to_not be_valid
  end
end
