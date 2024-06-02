class CreateBuildings < ActiveRecord::Migration[7.0]
    def change
      create_table :buildings do |t|
        t.integer :year_built
        t.string :wall_material
        t.integer :number_of_floors
        t.string :floor_type
        t.boolean :gas
        t.integer :number_of_entrances
        t.integer :number_of_apartments
  
        t.timestamps
      end
    end
  end