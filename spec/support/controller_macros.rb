module ControllerMacros

  def login_as(key = :mike_user)
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in create(key)
    end
  end

end
