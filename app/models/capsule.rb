class Capsule < ApplicationRecord
   
    belongs_to :user
    has_many :items, dependent: :destroy  #delete items within capsule. 
    # Use active storage? 
    validates :name, presence: true   # make sure capsules has a name 
end
