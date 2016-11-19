class AddValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
