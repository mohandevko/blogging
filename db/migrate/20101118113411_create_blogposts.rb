class CreateBlogposts < ActiveRecord::Migration
  def self.up
    create_table :blogposts do |t|
      t.string :name
      t.string :title
      t.text :content
      
      t.timestamps
    end
  end

  def self.down
    drop_table :blogposts
  end
end
