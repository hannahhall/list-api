class RemovePhotoUrlFromList < ActiveRecord::Migration[5.1]
  def change
    remove_column :lists, :photo_url
  end
end
