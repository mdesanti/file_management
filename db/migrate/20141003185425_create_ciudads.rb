class CreateCiudads < ActiveRecord::Migration
  def change
    create_table :ciudads do |t|
      t.text :descri

      t.timestamps
    end
  end
end
