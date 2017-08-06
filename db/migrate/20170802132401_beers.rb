class Beers < ActiveRecord::Migration[5.1]
  def change
    create_table :beers do |t|
      t.string :manufacturer
      t.string :name
      t.string :country
      t.float :price
      t.string :description

      t.references :category, foreign_key: true

      t.timestamps null: false
    end
  end
end
