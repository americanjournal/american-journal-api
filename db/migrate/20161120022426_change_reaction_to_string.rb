class ChangeReactionToString < ActiveRecord::Migration
  def change
    change_column :reactions, :feeling, :string
  end
end
