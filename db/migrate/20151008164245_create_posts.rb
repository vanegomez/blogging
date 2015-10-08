class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :author
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
