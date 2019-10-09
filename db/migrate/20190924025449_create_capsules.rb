class CreateCapsules < ActiveRecord::Migration[5.2]
  def change
    create_table :capsules do |t|
      t.string :name  
      #an object that contains an item and it's desc and contents 

      t.timestamps
    end
  end
end
