class Gallery < ActiveRecord::Base
    attr_accessible :name, :context_date
    has_many :photos, :dependent => :destroy

    accepts_nested_attributes_for :photos
end
