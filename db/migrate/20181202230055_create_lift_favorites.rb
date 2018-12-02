class CreateLiftFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_lifts do |t|
      t.references :user, foreign_key: true
      t.references :lift, foreign_key: true

      t.timestamps
    end
  end
end
