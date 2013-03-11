def login
  login_as create(:user)
end

def login_as(user)
  @current_user = user
  attrs = @current_user.attributes.with_indifferent_access.slice(:nickname, :name, :email)

  OmniAuth.config.test_mode = true
  OmniAuth.config.add_mock(:github, info: attrs)

  visit '/auth/github'
end

def current_user
  @current_user
end
