class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = Comment.new comment_params.merge(post_id: params[:post_id], user_id: params[:user_id])
    if comment.save
      flash[:notice] = 'Success!'
    else
      flash[:error] = 'Unable to post comment. Please try again.'
    end
    redirect_to user_post_path(params[:user_id], params[:post_id])
  end

  protected

  def comment_params
    params.require(:comment).permit(:post_id, :user_id, :comment_text)
  end
end
