class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :author
      t.references :level

      t.timestamps
    end
    add_index :comments, :author_id
    add_index :comments, :level_id
  end
end
