class Province < ApplicationRecord
  has_many :regionals, dependent: false
<<<<<<< HEAD
  has_many :kecamatans, through: :regional
=======
  has_many :kecamatans, through: :regionals
>>>>>>> 5bbe61a964433563dc8ad2d0d884314164abd829
end
