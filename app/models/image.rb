class Image < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validates :name, presence: true, length: { maximum: 63206 }
end
