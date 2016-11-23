class AddLatandlongToAuctions < ActiveRecord::Migration[5.0]
  def change
    add_column :auctions, :latitude, :float
    add_column :auctions, :longitude, :float
  end
end
