class AddTypeToMaterialCrudos < ActiveRecord::Migration
  def change
    rename_table :material_crudos, :materials
    add_column :materials, :type, :string
    Material.update_all(type: Material.types[:raw])
  end
end
