class Page < ActiveRecord::Base
  #attr_accessible :name, :permalink, :main_content
  validates_uniqueness_of :permalink
  validates_presence_of :main_content, :name
end
