class Gallery < ActiveRecord::Base
  attr_accessible :name, :context_date, :photos, :photos_attributes
  has_many :photos, :dependent => :destroy
  validates :name, :context_date, :presence => true
  validates :name, :length => { :in => 4..35 }

  accepts_nested_attributes_for :photos, :allow_destroy => true
end
