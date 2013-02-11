class Gallery < ActiveRecord::Base
  attr_accessible :name, :context_date, :photos, :photos_attributes
  has_many :photos, :dependent => :destroy
  validates :context_date, :presence => true
  validates :name, :length => { :in => 6..35 }

  accepts_nested_attributes_for :photos
end
