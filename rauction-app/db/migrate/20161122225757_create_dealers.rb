class CreateDealers < ActiveRecord::Migration[5.0]
  def change
    create_table :dealers do |t|
      t.string :company_name
      t.string :dealer_name
      t.string :address
      t.string :email
      t.integer :phone
      t.string :photo

      t.timestamps
    end
  end
end
