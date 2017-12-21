class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :price
      t.string :title
      t.integer :inventory
      t.integer :category_id
    end
  end
end
