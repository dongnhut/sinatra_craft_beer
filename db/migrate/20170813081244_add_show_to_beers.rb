class AddShowToBeers < ActiveRecord::Migration[5.1]
  # add column to beer
  def change
    add_column :beers, :show, :integer
  end
end
