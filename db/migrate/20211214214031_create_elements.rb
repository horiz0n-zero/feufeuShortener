class CreateElements < ActiveRecord::Migration[6.1]
  def change
    create_table :elements do |t|
      t.string :slug
      t.string :url
      t.integer :clics, default: 0
      t.integer :popularity, default: 0
      t.timestamps
    end
    add_index :elements, :id
  end
end
