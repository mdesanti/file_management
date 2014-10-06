class CreateDiscos < ActiveRecord::Migration
  def change
    create_table :discos do |t|
      t.text :descri

      t.timestamps
    end
  end
end
