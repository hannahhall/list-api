class ChangeNullConstraint < ActiveRecord::Migration[5.1]
  def change
    change_column :list_items, :description, :string, :null => true
  end
end
