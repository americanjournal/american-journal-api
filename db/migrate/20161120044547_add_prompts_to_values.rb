class AddPromptsToValues < ActiveRecord::Migration
  def change
    add_column :values, :prompt, :text
  end
end
