require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { Post.create(title: "Title", body: "Body", author: "me") }

  it 'is valid' do
    expect(post).to be_valid
  end

  it 'is invalid without a title' do
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'is invalid without a body' do
    post.body = nil
    expect(post).to_not be_valid
  end

  it 'is invalid without an author' do
    post.author = nil
    expect(post).to_not be_valid
  end
end
