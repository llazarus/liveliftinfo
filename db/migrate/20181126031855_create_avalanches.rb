class CreateAvalanches < ActiveRecord::Migration[5.2]
  def change
    create_table :avalanches do |t|
      t.datetime :date_issued
      t.datetime :valid_until
      t.text :highlights
      t.jsonb :danger_ratings

      t.timestamps
    end
  end
end
