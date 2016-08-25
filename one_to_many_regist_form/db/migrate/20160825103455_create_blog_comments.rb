class CreateBlogComments < ActiveRecord::Migration
  def change
    create_table :blog_comments do |t|
      t.integer :blog_id
      t.text :comment

      t.timestamps
    end
    add_index :blog_comments, :blog_id
  end
end
