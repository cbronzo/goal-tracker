module UserHelper

  def posts_link
    if params[:user_id].present?
      link_to 'View All Goals', posts_path
    else
      link_to 'View My Goals!', user_posts_path(current_user.id)
    end
  end

  def sorted_posts_link(sort_by)
    if params[:user_id].present?
      link_to sort_by, user_posts_path(current_user.id, sort_by: sort_by.downcase)
    else
      link_to sort_by, posts_path(sort_by: sort_by.downcase)
    end
  end
end
