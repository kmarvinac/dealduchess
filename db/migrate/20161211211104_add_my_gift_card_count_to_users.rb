class AddMyGiftCardCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :my_gift_cards_count, :integer
  end
end
