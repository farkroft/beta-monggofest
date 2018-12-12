class CreateProducts < ActiveRecord::Migration[5.2]
  # frozen_string_literal: true
  def change
    create_table :products do |t|
      t.references :kecamatan, foreign_key: true
<<<<<<< HEAD
      t.references :regional, foreign_key: true
      t.references :province, foreign_key: true
=======
      t.integer :product_type, default: 0
>>>>>>> 5bbe61a964433563dc8ad2d0d884314164abd829
      t.string :name

      t.timestamps
    end
  end
end
