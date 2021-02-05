class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :salt

      t.timestamps
    end
    add_index :users, :user_name
    add_index :users, :email
  end
end
