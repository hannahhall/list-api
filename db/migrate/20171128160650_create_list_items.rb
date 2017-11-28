class CreateListItems < ActiveRecord::Migration[5.1]
  def change
    create_table :list_items do |t|
      t.references :list, foreign_key: true
      t.string :title
      t.text :description
      t.boolean :is_done

      t.timestamps
    end
  end
end
