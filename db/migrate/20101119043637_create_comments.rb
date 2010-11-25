class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :user_id
      t.integer :blogpost_id
      t.text :description
      
      t.timestamps
    end
  end

  def self.downclear
  end
end


