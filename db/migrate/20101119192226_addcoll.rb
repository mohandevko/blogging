class Addcoll < ActiveRecord::Migration
  def self.up
    #add_column :blogposts, :user_id, :integer
  end

  def self.down
  remove_column :blogposts, :user_id
  end
end
