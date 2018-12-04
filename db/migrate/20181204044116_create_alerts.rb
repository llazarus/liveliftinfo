class CreateAlerts < ActiveRecord::Migration[5.2]
  def change
    create_table :alerts do |t|
      t.integer :lift_code
      t.string :name

      t.timestamps
    end
  end
end
