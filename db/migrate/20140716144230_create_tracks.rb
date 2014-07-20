class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :beacon_id
      t.integer :receiver_id
      t.string :patient_name
      t.string :place_name

      t.timestamps
    end
  end
end
