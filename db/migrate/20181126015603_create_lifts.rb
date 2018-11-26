class CreateLifts < ActiveRecord::Migration[5.2]
  def change
    create_table :lifts do |t|
      t.integer :lift_code
      t.string :name
      t.string :time_to_ride
      t.string :lift_type
      t.string :capacity
      t.string :capacity_hr
      t.string :elevation_m
      t.string :elevation_i
      t.string :vertical_m
      t.string :vertical_i
      t.boolean :alpine

      t.timestamps
    end
  end
end
