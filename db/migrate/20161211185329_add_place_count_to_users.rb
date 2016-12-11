class AddPlaceCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :places_count, :integer
  end
end
