class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
    if comment.save
      flash[:success] = "Comment Successfully Create."
      redirect_to blog_path(comment.blog)
    else
      binding.pry
      flash[:error] = comment.errors.full_messages
      redirect_to blog_path(comment.blog)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :blog_id, commenter_attributes: [:username])
    end
end
