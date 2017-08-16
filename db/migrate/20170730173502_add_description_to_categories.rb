class AddDescriptionToCategories < ActiveRecord::Migration[5.1]
  # add column to categories
  def change
    add_column :categories, :description, :string
  end
end
