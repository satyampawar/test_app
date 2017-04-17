class CallbacksController < Devise::OmniauthCallbacksController
	def facebook

    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end

  def twitter
  	@user = User.from_omniauth(request.env["omniauth.auth"])
  	sign_in_and_redirect @user
  end

  # [:facebook, :twitter].each do |method_name|
  # 	debugger
  # 	if !request.env["omniauth.auth"].nil?
	 #  	@user = User.from_omniauth(request.env["omniauth.auth"])
	 #  	sign_in_and_redirect @user
	 #  else
	 #  	debugger
	 #  end
  # end  

end