class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table :neighborhoods do |t|
      t.string :neighborhood_name

      t.timestamps

    end
  end
end
