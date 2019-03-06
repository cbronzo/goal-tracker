class CheersController < ApplicationController
  before_action :authenticate_user!

  def create
    cheer = Cheer.new cheer_params.merge(post_id: params[:post_id], user_id: current_user.id)
    if cheer.save
      flash[:notice] = 'Cheer added'
    else
      flash[:error] = 'Unable to post cheer. Please try again.'
    end
    Rails.logger.info cheer.errors.full_messages
    redirect_to user_post_path(current_user.id, params[:post_id])
  end

  protected

  def cheer_params
    params.require(:cheer).permit(:post_id, :comment_text)
  end
end
