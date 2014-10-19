class ChangeMaterialCrudoForMaterial < ActiveRecord::Migration
  def change
    rename_table :material_crudo_perrele, :material_perrele
    rename_column :material_perrele, :material_crudo_id, :material_id
    rename_table :material_crudo_tagtemas, :material_tagtemas
    rename_column :material_tagtemas, :material_crudo_id, :material_id
  end
end
