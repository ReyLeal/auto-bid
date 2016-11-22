class CreateAuctions < ActiveRecord::Migration[5.0]
  def change
    create_table :auctions do |t|
      t.integer :max_price
      t.string :title
      t.integer :year
      t.string :make
      t.string :model
      t.integer :miles_from
      t.string :address
      t.string :color
      t.text :features
      t.datetime :expiration_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
