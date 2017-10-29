class Plan < ApplicationRecord
  validates_uniqueness_of :orchestra
end
