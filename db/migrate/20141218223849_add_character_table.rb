class AddCharacterTable < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :character_name, null: false
      t.string :actor_name, null: false
      t.string :description
      t.integer :television_show_id, null: false
    end
  end
end
