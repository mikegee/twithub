module ApplicationHelper

  def login_path(provider = nil)
    provider ||= (Rails.env.production? || Rails.env.staging?) ? 'github' : 'developer'

    "/auth/#{provider}"
  end

end
