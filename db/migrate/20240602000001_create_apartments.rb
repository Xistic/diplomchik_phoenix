class CreateApartments < ActiveRecord::Migration[7.0]
    def change
      create_table :apartments do |t|
        t.references :building, null: false, foreign_key: true
        t.string :number
        t.integer :floor
        t.integer :number_of_rooms
        t.decimal :area, precision: 10, scale: 2
        t.decimal :price, precision: 10, scale: 2
  
        t.timestamps
      end
    end
  end