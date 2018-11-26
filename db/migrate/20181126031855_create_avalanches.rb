class CreateAvalanches < ActiveRecord::Migration[5.2]
  def change
    create_table :avalanches do |t|
      t.string :date_issued
      t.string :valid_until
      t.string :highlights
      t.jsonb :danger_ratings

      t.timestamps
    end
  end
end
