class Zipcodes < ActiveRecord::Migration[5.0]
  def change
    create_table :zip_codes do |t|
      t.string :zip_code , null:false
      t.string :location , null:false
      t.string :county , null:false
      t.index [:zip_code]
      t.index [:location]
      t.timestamps
    end
    
  end
end
