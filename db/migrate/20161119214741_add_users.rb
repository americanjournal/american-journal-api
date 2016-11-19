class AddUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :age, null: false
      t.integer :candidate, null: false
      t.string :username, null: false

      t.timestamps
    end
  end
end
