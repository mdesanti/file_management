class CreateBackups < ActiveRecord::Migration
  def change
    create_table :backups do |t|
      t.text :descri

      t.timestamps
    end
  end
end
