class CreateForecasts < ActiveRecord::Migration[5.2]
  def change
    create_table :forecasts do |t|
      t.string :new_snow_i
      t.string :two_days_i
      t.string :seven_days_i
      t.string :snowpack_i
      t.jsonb :forecast

      t.timestamps
    end
  end
end
