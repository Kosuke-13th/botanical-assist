class CreatePlants < ActiveRecord::Migration[7.0]
  def change
    create_table :plants do |t|
      t.string     :plant_name,            null: false
      t.string     :plant_category,        null: false
      t.integer    :watering_id,           null: false
      t.integer    :growth_time_id,        null: false
      t.integer    :agrochemical_time_id,  null: false
      t.text       :plant_text
      t.integer    :plant_price
      t.datetime   :start_time
      t.references :user,                  null: false, foreign_key: true
      t.timestamps
    end
  end
end
