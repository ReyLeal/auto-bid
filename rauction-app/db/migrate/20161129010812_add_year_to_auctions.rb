class AddYearToAuctions < ActiveRecord::Migration[5.0]
  def change
    add_column :auctions, :year, :string
  end
end
