require "rails_helper"

RSpec.feature "user" do
  let(:post) { Post.create(title: "My Post", body: "Lots of Text", author: "me") }

  before(:each) do
    visit root_path
    post
    visit drafts_posts_path
    click_link "Publish"
  end

  it "can create comments" do
    click_link "My Post"
    expect(current_path).to eq(post_path(post))
    assert page.has_content?("Make a Comment")

    fill_in "Author", with: "Vane"
    fill_in "Body", with: "Some text"
    click_button "Create Comment"
    expect(current_path).to eq(post_path(post))
    assert page.has_content?("Vane")
  end
end
