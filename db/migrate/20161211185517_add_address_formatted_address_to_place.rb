class AddAddressFormattedAddressToPlace < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :address_formatted_address, :string
  end
end
