class Comment < ActiveRecord::Base

  #validations
  #validates_presence_of :blogpost_id, :description
  
  #associations
  belongs_to :blogpost
  belongs_to :users
  
end

