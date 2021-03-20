class CreateBringCards < ActiveRecord::Migration[6.1]
  def change
    create_table :bring_cards do |t|
      t.references  :user,  index: true, foreign_key: true
      t.references  :post, index: true, foreign_key: true
      t.timestamps
    end
  end
end
