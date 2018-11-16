class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.text :description
      t.integer :number_of_pages
      t.integer :quantity
      t.float :price
      t.bigint :publisher_id
      t.references :author
      t.references :category

      t.timestamps
    end
  end
end
