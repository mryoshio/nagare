class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :code

      t.timestamps
    end
  end
end
