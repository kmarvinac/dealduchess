class AddDealCountToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :deals_count, :integer
  end
end
