class AddPlaceCountToNeighborhoods < ActiveRecord::Migration[5.0]
  def change
    add_column :neighborhoods, :places_count, :integer
  end
end
