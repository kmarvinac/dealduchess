class AddUserIdToMyGiftCards < ActiveRecord::Migration[5.0]
  def change
    add_column :my_gift_cards, :user_id, :integer
  end
end
