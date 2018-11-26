class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.integer :lift_code
      t.string :name
      t.string :status

      t.timestamps
    end
  end
end
