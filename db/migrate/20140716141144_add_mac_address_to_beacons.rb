class AddMacAddressToBeacons < ActiveRecord::Migration
  def change
    add_column :beacons, :mac_address, :string, after: :uuid
  end
end
