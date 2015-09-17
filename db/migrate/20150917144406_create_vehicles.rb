class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :make
      t.integer :photos_count, default: 0

      t.timestamps null: false
    end
  end
end
