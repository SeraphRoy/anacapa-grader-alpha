class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :rememberable, :trackable, :omniauthable, :omniauth_providers => [:github]

  def self.from_omniauth(auth)
  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  		user.email = auth.info.email
  		user.provider = auth.provider
  		user.uid = auth.uid
  		user.name = auth.info.name
  		user.github_token = auth.credentials.token
  	end
  end

  def is_admin
    self.has_role? :admin
  end

end
