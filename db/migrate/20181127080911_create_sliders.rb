class CreateSliders < ActiveRecord::Migration[5.2]
  def change
    create_table :sliders do |t|
      t.string :name
      t.string :img
      t.string :url
      t.integer :sort_number
      t.boolean :isActive
      t.timestamps
    end
  end
end
