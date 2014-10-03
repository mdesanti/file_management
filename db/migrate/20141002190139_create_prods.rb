class CreateProds < ActiveRecord::Migration
  def change
    create_table :prods do |t|
      t.text :descri
      t.references :client

      t.timestamps
    end
  end
end
