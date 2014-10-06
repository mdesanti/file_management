class CreatePerreles < ActiveRecord::Migration
  def change
    create_table :perreles do |t|
      t.text :descri

      t.timestamps
    end
  end
end
