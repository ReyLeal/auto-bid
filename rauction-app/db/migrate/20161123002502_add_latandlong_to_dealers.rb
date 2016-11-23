class AddLatandlongToDealers < ActiveRecord::Migration[5.0]
  def change
    add_column :dealers, :latitude, :float
    add_column :dealers, :longitude, :float
  end
end
