class CreateApartmentChecks < ActiveRecord::Migration[6.1]
    def change
      create_table :apartment_checks do |t|
        t.references :apartment, null: false, foreign_key: true
        t.string :checked_by
        t.integer :status, default: 0
        t.text :notes
  
        t.timestamps
      end
    end
  end