class CreateStorageInfos < ActiveRecord::Migration
  def change
    create_table :storage_infos do |t|
      t.references :equipo
      t.references :disco
      t.references :ruta
      t.references :material

      t.timestamps
    end
    Material.all.each { |m| StorageInfo.create!(equipo_id: m.equipo_id, disco_id: m.disco_id, ruta_id: m.ruta_id, material_id: m.id) }
    remove_column :materials, :equipo_id
    remove_column :materials, :disco_id
    remove_column :materials, :ruta_id
  end
end
