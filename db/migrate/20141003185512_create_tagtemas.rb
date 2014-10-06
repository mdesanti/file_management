class CreateTagtemas < ActiveRecord::Migration
  def change
    create_table :tagtemas do |t|
      t.text :descri

      t.timestamps
    end
  end
end
