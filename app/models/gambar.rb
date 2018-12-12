class Gambar < ApplicationRecord
  belongs_to :product
  has_many :product_invests
  mount_uploader :photo, PhotoUploader
end
