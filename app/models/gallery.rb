class Gallery < ActiveRecord::Base
    attr_accessible :name, :context_date
    has_many :photos, :dependent => :destroy
end
