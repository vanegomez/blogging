class PostsController < ApplicationController
  def index
    @posts = Post.all
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


