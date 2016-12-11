class CreateMyGiftCards < ActiveRecord::Migration
  def change
    create_table :my_gift_cards do |t|
      t.integer :place_id
      t.datetime :expiration_date
      t.string :card_image
      t.integer :user_id

      t.timestamps

    end
  end
end
