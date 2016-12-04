class AddYearToAuction < ActiveRecord::Migration[5.0]
  def change
    add_column :auctions, :year, :integer
  end
end
