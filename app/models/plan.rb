class Plan < ActiveRecord::Base
  #attr_accessible :header, :orchestra
  validates_uniqueness_of :orchestra
end
