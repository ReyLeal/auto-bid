class RemoveYearFromAuctions < ActiveRecord::Migration[5.0]
  def change
    remove_column :auctions, :year, :integer
  end
end
