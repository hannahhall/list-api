class CreateListItems < ActiveRecord::Migration[5.1]
  def change
    create_table :list_items do |t|
      t.references :list, foreign_key: true, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.boolean :is_done, null: false, default: false

      t.timestamps
    end
  end
end
