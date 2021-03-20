class AddLoveToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :love, :string
  end
end
