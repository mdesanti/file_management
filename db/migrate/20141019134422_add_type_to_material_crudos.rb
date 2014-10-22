class AddTypeToMaterialCrudos < ActiveRecord::Migration
  def change
    rename_table :material_crudos, :materials
    add_column :materials, :type, :string
  end
end
