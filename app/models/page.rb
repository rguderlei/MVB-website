class Page < ApplicationRecord
  validates_uniqueness_of :permalink
  validates_presence_of :main_content, :name
end
