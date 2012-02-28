class PressArticle < ActiveRecord::Base
  attr_accessible :article, :event_id
  belongs_to :event
  has_attached_file :article
end
