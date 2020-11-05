class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :country
      t.belongs_to :student

      t.timestamps
    end
    add_index :companies, :name, :unique => true
  end
end
