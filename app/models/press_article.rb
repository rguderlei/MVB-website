class PressArticle < ActiveRecord::Base
  attr_accessible :title, :publisher, :print_date, :article, :event_id
  belongs_to :event, :polymorphic => true
  has_attached_file :article,  :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      :url => "/system/:attachment/:id/:style/:filename"

  validates_presence_of :title
end
