class CreateKabupatens < ActiveRecord::Migration[5.2]
  def change
    create_table :kabupatens do |t|
      t.references :province, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
