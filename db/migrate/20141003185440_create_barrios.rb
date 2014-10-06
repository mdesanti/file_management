class CreateBarrios < ActiveRecord::Migration
  def change
    create_table :barrios do |t|
      t.text :descri

      t.timestamps
    end
  end
end
