class CreateCardRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :card_relations do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :card_id

      t.timestamps
    end
  end
end
