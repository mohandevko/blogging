class Blogpost < ActiveRecord::Base
  acts_as_rated
  #validations
  validates_presence_of :name, :title, :content
  validates_length_of :title, :minimum => 5
  validates_length_of :content, :minimum => 10
  
  #associations
  has_many :comments
  
  
  
end
