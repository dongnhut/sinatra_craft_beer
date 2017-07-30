class CreateAdmin < ActiveRecord::Migration[5.1]
  def change
    create_table :admin do |t|
      t.string :name
      t.string :username, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.timestamps null: false
    end
  end
end
