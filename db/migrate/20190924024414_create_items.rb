class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name  
      t.string :description
      t.integer :capsule_id   #foregn key 

      t.timestamps
    end
  end
end
