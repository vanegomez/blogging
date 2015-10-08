class PostsController < ApplicationController
  def index
    @posts = Post.all.published_posts
  end

  def drafts
    @posts = Post.all.draft_posts
  end

  def show
    @post = set_post
    @comment = Comment.new
    @comment.post_id = @post.id
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to drafts_posts_path
    else
      flash.now[:errors] = @post.errors.full_messages.join(", ")
      render :new
    end
  end

  def update
    @post = set_post
    if @post.status == "draft"
      @post.update_attributes(status: 1)
    end
    redirect_to root_path
  end

  def destroy
    set_post.destroy!
  end

  private

  def set_post
    Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :author)
  end
end



