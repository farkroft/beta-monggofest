class AddPaymentMethodToPaymentDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :payment_details, :payment_method, :integer
    add_column :payment_details, :integer, :string
  end
end
