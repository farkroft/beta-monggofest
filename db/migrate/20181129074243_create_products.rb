class CreateProducts < ActiveRecord::Migration[5.2]
  # frozen_string_literal: true
  def change
    create_table :products do |t|
      t.references :kecamatan, foreign_key: true
      t.integer :product_type, default: 0
      t.string :name

      t.timestamps
    end
  end
end
