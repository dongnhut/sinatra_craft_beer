class CreateCustomerBeers < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_beers do |t|
      t.references :beer
      t.references :customer
    end
  end
end
