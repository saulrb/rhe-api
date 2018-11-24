class CreateCustomer < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :firstname , null: false
      t.string :lastname , null: false
      t.string :street , null: false
      t.string :location, null: false
      t.string :city
      t.string :county
      t.string :zip_code
      t.string :phone ,null: false
      t.string :mobile
      t.string :email , unique: true
      t.index [:firstname, :lastname]
      t.index [:city, :location, :street]
      t.timestamps
    end
  end
end
