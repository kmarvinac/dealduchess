class AddPlaceCountToPlaceTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :place_types, :places_count, :integer
  end
end
