class Regional < ApplicationRecord
  belongs_to :province
  has_many :subdistrict, dependent: false

end
