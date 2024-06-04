class AddNameToBuildings < ActiveRecord::Migration[7.1]
  def change
    add_column :buildings, :name, :string
  end
end
