class MaterialCrudoPerrel < ActiveRecord::Migration
  def change
    create_table :material_crudo_perrele do |t|
      t.references :material_crudo, index: true
      t.references :perrele, index: true
    end
  end
end
