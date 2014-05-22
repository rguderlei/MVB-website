class PressArticle < ActiveRecord::Base
  belongs_to :event, :polymorphic => true
  has_attached_file :article,  :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      :url => "/system/:attachment/:id/:style/:filename"

  validates_attachment :article, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }

  validates :title, :print_date, :publisher, :presence => true
end
