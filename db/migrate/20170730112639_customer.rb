class Customer < ActiveRecord::Migration[5.1]
  def change
    create_table :customer do |t|
      t.string :username
      t.string :password
      t.string :name
      t.string :avatar
      t.datetime :birthday

      t.timestamps null: false
    end
  end
end
