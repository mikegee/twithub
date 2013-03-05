module ApplicationHelper

  def login_path(provider = 'github')
    provider ||= (Rails.env.production? || Rails.env.staging?) ? 'github' : 'developer'

    "/auth/#{provider}"
  end

end
