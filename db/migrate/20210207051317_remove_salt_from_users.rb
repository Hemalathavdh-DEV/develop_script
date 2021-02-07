class RemoveSaltFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :salt, :string
  end
end
