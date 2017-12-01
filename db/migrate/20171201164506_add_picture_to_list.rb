class AddPictureToList < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :picture, :string
  end
end
