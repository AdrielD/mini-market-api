class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string  :name,        null: false
      t.text    :description, null: false, default: ''
      t.bigint  :category_id, null: false
      t.decimal :price,       null: false, precision: 10, scale: 2, default: 0.00
      t.boolean :active,      null: false, default: true

      t.timestamps
    end

    add_foreign_key :products, :categories, column: :category_id
  end
end
