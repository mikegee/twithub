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
end
