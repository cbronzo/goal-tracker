module UserHelper

  def posts_link
    if params[:user_id].present?
      link_to 'View All Goals', posts_path
    else
      link_to 'View My Goals!', user_posts_path(current_user.id)
    end
  end
end
