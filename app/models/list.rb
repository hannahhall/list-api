class List < ApplicationRecord
  belongs_to :user
  belongs_to :category
  mount_base64_uploader :picture, PictureUploader
end
