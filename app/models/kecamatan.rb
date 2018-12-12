class Kecamatan < ApplicationRecord
  belongs_to :regional
  has_many :product, dependent: false
end
