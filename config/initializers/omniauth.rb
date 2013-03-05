Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production? || Rails.env.staging?
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
end

OmniAuth.config.logger = Rails.logger
