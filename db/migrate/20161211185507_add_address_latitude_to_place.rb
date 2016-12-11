class AddAddressLatitudeToPlace < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :address_latitude, :float
  end
end
