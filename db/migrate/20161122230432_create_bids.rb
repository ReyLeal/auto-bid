class CreateBids < ActiveRecord::Migration[5.0]
  def change
    create_table :bids do |t|
      t.integer :bid_amount
      t.timestamp :time_added
      t.references :user, foreign_key: true
      t.references :auction, foreign_key: true
      t.references :dealer, foreign_key: true

      t.timestamps
    end
  end
end
