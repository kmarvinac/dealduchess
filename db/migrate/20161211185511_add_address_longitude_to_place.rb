class AddAddressLongitudeToPlace < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :address_longitude, :float
  end
end
