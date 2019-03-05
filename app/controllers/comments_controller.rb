class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = Comment.new comment_params.merge(post_id: params[:post_id], user_id: current_user.id)
    if comment.save
      flash[:notice] = 'Comment added'
    else
      flash[:error] = 'Unable to post comment. Please try again.'
    end
    Rails.logger.info comment.errors.full_messages
    redirect_to user_post_path(current_user.id, params[:post_id])
  end

  protected

  def comment_params
    params.require(:comment).permit(:post_id, :comment_text)
  end
end
