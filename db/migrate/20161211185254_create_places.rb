class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :place_name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :neighborhood_id
      t.integer :place_type_id
      t.integer :user_id
      t.text :comments

      t.timestamps

    end
  end
end
