class CreateCashManagements < ActiveRecord::Migration[6.0]
  def change
    create_table :cash_managements do |t|
      t.decimal :initial_cash
      t.decimal :cash_out
      t.decimal :cash_in
      t.string :entry_month
      t.belongs_to :company

      t.timestamps
    end
  end
end
