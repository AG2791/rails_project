class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.string :session_id, null: false
      t.text :data
      t.timestamps
    end
    #search user sessions
    add_index :sessions, :session_id, unique: true   #read more about indexing 
    add_index :sessions, :updat
  end
end
