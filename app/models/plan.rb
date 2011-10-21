class Plan < ActiveRecord::Base
  validates_uniqueness_of :orchestra
end
