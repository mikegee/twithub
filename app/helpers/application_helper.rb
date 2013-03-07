module ApplicationHelper

  def login_path(provider = nil)
    provider ||= (Rails.env.production? || Rails.env.staging?) ? 'github' : 'developer'

    "/auth/#{provider}"
  end

  def follow_button(user)
    if current_user.follows? user
      link_to 'Following', user_follow_path(current_user, user.id), method: 'delete', class: 'btn btn-primary following'
    elsif user != current_user
      link_to 'Follow', user_follows_path(current_user, follow: {followee_id: user.id}), method: 'post', class: 'btn followable'
    end
  end

  def favorite_link(status)
    isa_fav = current_user.favorite?(status)
    content_tag :div, class: 'fav ' + (isa_fav ? 'favorited' : 'not-favorited') do
      if isa_fav
        title = 'Unmark as Favorite'
        link_to star_icon(title), user_favorite_path(current_user, status.id), method: 'delete', title: title, remote: true
      else
        title  = 'Mark as Favorite'
        link_to star_icon(title), user_favorites_path(current_user, status_id: status.id), method: 'post', title: title, remote: true
      end
    end
  end

  def star_icon(title)
    content_tag(:i, '', class: 'icon icon-star') +
    content_tag(:span, title, class: 'hide')
  end

end
