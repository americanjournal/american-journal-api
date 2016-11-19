class AddReactions < ActiveRecord::Migration
  def change
    create_table :reactions do |t|
      t.integer :feeling, null: false
      t.integer :user_id, null: false
      t.integer :story_id, null: false

      t.timestamps
    end

    add_index :reactions, :story_id
  end
end
