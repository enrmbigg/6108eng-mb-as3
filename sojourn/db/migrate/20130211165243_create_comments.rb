class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author_name
      t.integer :article_id
      t.text :body

      t.timestamps
    end
  end
end
