class MaterialCrudoTagtemas < ActiveRecord::Migration
  def change
    create_table :material_crudo_tagtemas do |t|
      t.references :material_crudo, index: true
      t.references :tagtemas, index: true
    end
  end
end
