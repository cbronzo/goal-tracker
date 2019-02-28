class ApplicationController < ActionController::Base


  private

  def  current_user
    @current_user
  end

  def logged_in?
    !!current_userx
  end
end
