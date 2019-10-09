class AddUserRefToCapsules < ActiveRecord::Migration[5.2]
  def change
    add_reference :capsules, :user, foreign_key: true
  end
end
