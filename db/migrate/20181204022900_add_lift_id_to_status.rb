class AddLiftIdToStatus < ActiveRecord::Migration[5.2]
  def change
    add_column :statuses, :lift_id, :integer
  end
end
