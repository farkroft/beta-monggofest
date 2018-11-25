class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :type
      t.string :name
      t.string :image
      t.references :province, foreign_key: true
      t.references :product_type, foreign_key: true

      t.timestamps
    end
  end
end
