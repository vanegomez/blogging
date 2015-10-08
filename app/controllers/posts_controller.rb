class PostsController < ApplicationController
  def index
    @posts = Post.all.published_posts
  end

  def drafts
    @posts = Post.all.draft_posts
  end

  def show
    @post = set_post
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to root_path
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
    # @ride = Ride.find(params[:id])
    # if @ride.status == "active"
    #   @ride.update_attributes(driver_id: current_driver.id, accepted_time: Time.now, status: 1)
    # elsif @ride.status == "accepted"
    #   @ride.update_attributes(pickup_time: Time.now, status: 2)
    # else
    #   @ride.update_attributes(dropoff_time: Time.now, status: 3)
    # end
    # redirect_to driver_path(current_driver)
  end

  private

  def set_post
    Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :author)
  end
end


# class IdeasController < ApplicationController
#   def index
#     @ideas = Idea.all
#     @idea = Idea.new
#   end
#
#   def create
#     idea = Idea.create(idea_params)
#
#     render partial: "ideas/idea", locals: { idea: idea }
#   end
#
#   def destroy
#     idea = Idea.find(params[:id])
#     idea.destroy!
#
#     render json: {status: :success}
#   end
#
#   private
#
#   def idea_params
#     params.require(:idea).permit(:title, :body)
#   end
# end


