class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :discount_type
      t.text :terms_of_deal
      t.string :day_of_week
      t.integer :place_id

      t.timestamps

    end
  end
end
