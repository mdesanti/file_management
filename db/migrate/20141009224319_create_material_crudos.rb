class CreateMaterialCrudos < ActiveRecord::Migration
  def change
    create_table :material_crudos do |t|
      t.references :client, index: true
      t.references :prod, index: true
      t.text :titulo
      t.references :tipo, index: true
      t.text :descri
      t.references :ciudad, index: true
      t.references :barrio, index: true
      t.date :fecha_desde
      t.date :fecha_hasta
      t.text :discurso
      t.references :equipo, index: true
      t.references :disco, index: true
      t.references :ruta, index: true

      t.timestamps
    end
  end
end
