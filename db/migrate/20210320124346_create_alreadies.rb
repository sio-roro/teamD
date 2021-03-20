class CreateAlreadies < ActiveRecord::Migration[6.1]
  def change
    create_table :alreadies do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :player_id

      t.timestamps
    end
  end
end
