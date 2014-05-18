class CreateBeaconHolders < ActiveRecord::Migration
  def change
    create_table :beacon_holders do |t|
      t.integer :beacon_id
      t.integer :patient_id

      t.timestamps
    end
  end
end
