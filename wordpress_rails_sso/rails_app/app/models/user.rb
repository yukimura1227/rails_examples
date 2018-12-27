class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  # providerがある場合 (ex) woredpress経由で認証した等）は、
  # passwordは要求しないようにする。
  def password_required?
    super && provider.blank?
  end

  def self.find_for_wordpress_oauth2(oauth, signed_in_user=nil)
    #if the user was already signed in / but they navigated through the authorization with wordpress
    if signed_in_user

      #update / synch any information you want from the authentication service.
      if signed_in_user.email.nil? or signed_in_user.email.eql?('')
        signed_in_user.update_attributes(email: oauth['info']['email'])
      end

      return signed_in_user
    else
      #find user by id and provider.
      user = User.where(provider: oauth['provider'], uid: oauth['uid']).first

      #if user isn't in our dabase yet, create it!
      if user.nil?
        user = User.create!(email: oauth['info']['email'], uid: oauth['uid'], provider: oauth['provider'])
      end

      user
    end
  end
end
