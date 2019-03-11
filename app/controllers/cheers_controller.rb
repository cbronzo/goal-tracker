class CheersController < ApplicationController
  before_action :authenticate_user!



  def new
    @cheer = Cheer.new cheer_params.merge(post_id: params[:post_id], user_id: current_user.id)
  end

  def create
    if params[:direction] == 'upvote'
      @cheer = Cheer.new user_id: current_user.id, post_id: params[:id]
      if @cheer.save
        flash[:notice] = 'Cheer added'
      else
        flash[:error] = 'Unable to post cheer. Please try again.'
      end
    else
      @cheer = Cheer.find_by(user_id: current_user.id, post_id: params[:id])
      if @cheer.delete
        flash[:notice] = 'Cheer removed'
      else
        flash[:error] = 'Unable to remove cheer. Please try again.'
      end
    end

  end



  protected

  def cheer_params
    params.require(:cheers).permit(:post_id, :user_id)
  end

  def new_cheer_params
    params.require(:id)
  end

end
