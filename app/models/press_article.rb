class PressArticle < ActiveRecord::Base
  attr_accessible :title, :publisher, :print_date, :article, :event_id
  belongs_to :event, :polymorphic => true
  has_attached_file :article

  validates_presence_of :title
end
