class UserPolicy < DirectiveAdmin::Policy

  def impersonate?
    false
  end

end
