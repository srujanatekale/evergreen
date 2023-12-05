class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name, :null => false
      t.text :description
      t.integer :price, :null => false
    end
  end
end
