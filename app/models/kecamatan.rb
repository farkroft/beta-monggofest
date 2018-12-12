class Kecamatan < ApplicationRecord
  belongs_to :regional
<<<<<<< HEAD
=======
  has_many :product, dependent: false
>>>>>>> 5bbe61a964433563dc8ad2d0d884314164abd829
end
