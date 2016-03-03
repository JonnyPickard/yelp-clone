class User < ActiveRecord::Base
  has_many :reviewed_restaurants, through: :reviews, source: :restaurant
  has_many :reviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

 def self.from_omniauth(auth)
   where(provider: auth_provider, uid: auth.uid).first_or_create do |user|
     user.email = auth.info.email
     user.password = Devise.friendly_token[0, 20]
     user.name = auth.info.name
     user.image = auth.info.image
   end
 end
end
