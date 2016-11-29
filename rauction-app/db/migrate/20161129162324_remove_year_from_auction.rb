class RemoveYearFromAuction < ActiveRecord::Migration[5.0]
  def change
    remove_column :auctions, :year, :string
  end
end
