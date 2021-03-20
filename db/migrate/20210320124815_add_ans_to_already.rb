class AddAnsToAlready < ActiveRecord::Migration[6.1]
  def change
    add_column :alreadies, :ans, :string
  end
end
