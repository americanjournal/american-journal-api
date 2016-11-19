class AddStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :story, null: false
      t.integer :user_id, null: false
      t.integer :value_id, null: false

      t.timestamps
    end

    add_index :stories, :user_id
    add_index :stories, :value_id
  end
end
