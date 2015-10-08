require "rails_helper"

RSpec.feature "user" do
  let(:post) { Post.create(title: "My Post", body: "Lots of Text", author: "me") }

  before(:each) do
    visit root_path
    post
  end

  it "can create new post" do
    click_link "New Post"
    expect(current_path).to eq(new_post_path)
    assert page.has_content?("New Blog Post")

    fill_in "Title", with: "Title"
    fill_in "Body", with: "Some text"
    fill_in "Author", with: "Me"
    click_button "Create Post"
    expect(current_path).to eq(drafts_posts_path)
    assert page.has_content?("Title")
  end

  it "can't create a post without missing attributes" do
    click_link "New Post"
    fill_in "Title", with: "Title"
    fill_in "Body", with: "Some text"
    click_button "Create Post"

    assert page.has_content?("Author can't be blank")
  end

  it "can publish a draft post" do
    expect(current_path).to eq(root_path)
    refute page.has_content?("My Post")

    visit drafts_posts_path
    expect(current_path).to eq(drafts_posts_path)
    assert page.has_content?("My Post")

    click_link "Publish"
    expect(current_path).to eq(root_path)
    assert page.has_content?("My Post")
  end
end
