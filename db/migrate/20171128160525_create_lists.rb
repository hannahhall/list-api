class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.references :user, foreign_key: true, null:false
      t.references :category, foreign_key: true, null:false
      t.datetime :due_date
      t.string :photo_url

      t.timestamps
    end
  end
end
