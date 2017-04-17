class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable



  has_many :messages
  has_many :conversations, foreign_key: :sender_id
  has_many :payments

def self.from_omniauth(auth)
    # @user ||= User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)
    # if !@user.persisted?
    logger.info auth
    user = self.find_by_email(auth.info.email)
    debugger
    if !auth.info.email.present?
      user = self.find_by_email(auth.uid+"@facebook.com")
      if !user
      user = User.create!(email: auth.uid+"@facebook.com",
                       password: Devise.friendly_token[0,20],
                       first_name: auth.info.name,
                       last_name: "",
                       img_url: auth.info.image+"?type=large",
                       provider: auth.provider,
                       uid: auth.uid)
      end
      user
    
    elsif user.present?
      user
    else
      user = where(email: auth.info.email).first
      user = User.create!(email: auth.info.email,
                       password: Devise.friendly_token[0,20],
                       first_name: auth.info.name,
                       last_name: "",
                       img_url: auth.info.image+"?type=large",
                       provider: auth.provider,
                       uid: auth.uid)
      user
    end
    # else
    #   sign_in_and_redirect @user, event: :authentication
    #         if is_navigational_format?
    #             set_flash_message(:notice, :success, kind: "Facebook")
    #         end
    # end
end




end
