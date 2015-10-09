class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.new(comment_params)
    @comment.post_id = post.id

    @comment.save

    render partial: "comments/comment", locals: { post: post, comment: @comment }
    # redirect_to post_path(@comment.post)
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end
end
