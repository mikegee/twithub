def login
  @current_user = create(:user)
  attrs = @current_user.attributes.with_indifferent_access.slice(:name, :email)

  OmniAuth.config.test_mode = true
  OmniAuth.config.add_mock(:github, attrs)

  visit '/auth/github'
end
