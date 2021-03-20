class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :"body"
      t.string :"disc"

      t.timestamps
    end
  end
end
