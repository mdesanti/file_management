class CreateEquipos < ActiveRecord::Migration
  def change
    create_table :equipos do |t|
      t.text :descri

      t.timestamps
    end
  end
end
