class CreateBeacons < ActiveRecord::Migration
  def change
    create_table :beacons do |t|
      t.string :uuid
      t.integer :major
      t.integer :minor
      t.string :color
      t.string :name

      t.timestamps
    end
  end
end
