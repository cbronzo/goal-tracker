module UserHelper


  def posts_link
    if params[:user_id].present?
      link_to 'View All Goals', root_path
    else
      link_to 'View My Goals', user_posts_path(current_user.id)
    end
  end

  def sorted_posts_link(sort_by, link_text = nil)
  text = link_text || sort_by.humanize

  if params[:user_id].present?
    link_to text, user_posts_path(current_user.id, sort_by: sort_by.downcase)
  else
    link_to text, post_path(sort_by: sort_by.downcase)
  end
end
end
