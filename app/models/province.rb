class Province < ApplicationRecord
<<<<<<< HEAD
  has_many :regionals, dependent: false
  has_many :kecamatans, through: :regionals
=======
    has_many :regionals
    has_many :kecamatans, through: :regional
>>>>>>> 815941e9e3f23d1bac59a9006bab048686cead55
end
