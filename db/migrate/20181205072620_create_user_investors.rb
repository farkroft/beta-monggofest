class CreateUserInvestors < ActiveRecord::Migration[5.2]
  def change
    create_table :user_investors do |t|
      t.references :user_investors, :user, index: true
      t.integer :investor_slot
      t.float :investor_pay
      t.integer :invest_year

      t.timestamps
    end
  end
end
