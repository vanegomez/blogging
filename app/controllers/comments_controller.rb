class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]

    @comment.save

    redirect_to post_path(@comment.post)
  end

  def destroy
    set_comment.destroy!
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end

  def set_comment
    Post.find(params[:id])
  end
end
