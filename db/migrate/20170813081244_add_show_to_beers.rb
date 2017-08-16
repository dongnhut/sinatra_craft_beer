class AddShowToBeers < ActiveRecord::Migration[5.1]
  def change
    add_column :beers, :show, :integer
  end
end
