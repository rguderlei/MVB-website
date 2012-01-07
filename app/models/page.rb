class Page < ActiveRecord::Base
  validates_uniqueness_of :permalink
  validates_presence_of :main_content, :name
end
