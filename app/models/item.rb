class Item < ApplicationRecord
    belongs_to :capsule     #review thesee associations macros  all( remember these association macros just add methods to the model )
    # Use active storage her or in capsule model? 
    has_many_attached :uploads  # caspule item files 

   #imagemagic resize images 
#    def thumbnail input
#     return self.uploads[input].variant(resize: "300x300").processed
#    end

    validates :name, presence: true
    validates :description, presence: true
end
