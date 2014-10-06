class CreateRuta < ActiveRecord::Migration
  def change
    create_table :ruta do |t|
      t.text :descri

      t.timestamps
    end
  end
end
