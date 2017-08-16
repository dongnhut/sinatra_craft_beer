class CreateBeers < ActiveRecord::Migration[5.1]
  def change
    create_table :beers do |t|
      t.references :category
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
