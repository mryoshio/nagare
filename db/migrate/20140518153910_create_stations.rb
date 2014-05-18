class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.integer :place_id
      t.integer :receiver_id

      t.timestamps
    end
  end
end
