class Regional < ApplicationRecord
  belongs_to :province
<<<<<<< HEAD
  has_many :kecamatan, dependent: false
=======
  has_many :kecamatans, dependent: false
>>>>>>> 5bbe61a964433563dc8ad2d0d884314164abd829
end
