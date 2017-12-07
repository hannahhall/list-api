class List < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :list_items
  mount_base64_uploader :picture, PictureUploader
end
