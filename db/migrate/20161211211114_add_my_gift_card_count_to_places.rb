class AddMyGiftCardCountToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :my_gift_cards_count, :integer
  end
end
