class CreatePaymentDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_details do |t|
      t.integer :user_investor_id
      t.string :card_number
      t.date :card_valid_date
      t.string :cvv
      t.boolean :isPaid, :default => false
 
      t.timestamps
    end
  end
end
