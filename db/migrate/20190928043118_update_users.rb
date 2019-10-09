class UpdateUsers < ActiveRecord::Migration[5.2]
  def change
    add_column(:users, :provider, :string, limit: 50, null: false, default: '')
                     #google/github
    add_column(:users, :uid, :string, limit: 500, null: false, default: '')
                   #UID is the user id assigned to a user by google or github 
    # The provider and uid fields identify a user uniquely as this pair will always have unique values.
  end
end
