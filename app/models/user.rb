class User < ApplicationRecord
 
  validates :email, :presence => true      #require an email
  validates :email, :uniqueness => true    # unique emails

  has_many :capsules  #mod on 9/24
  # accepts_nested_attributes_for :capsules  #mod on 9/24 may not be necessary 
  has_one_attached :avatar


  # Devise w/ Third party validation

  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :confirmable, :lockable, :timeoutable,
  :omniauthable, omniauth_providers: [:github, :google_oauth2]  #omniauth_provider array to register Onmiautn strategy
 #:confirmable, Set this up later 

  def self.create_from_provider_data(provider_data)  #takes in data from provider checks for existing user or creates user in db
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
      user.email = provider_data.info.email  #set user attribute from provider
      user.password = Devise.friendly_token[0, 20] #sets an arbitrary password for the user since it is not exposed by the provider and is required to create a user
      user.skip_confirmation!  #skips the user email verification process since it has already been verified by the respective provider
    end
  end

  protected
def confirmation_required?  #rebuild with later with email
  false
end



end
