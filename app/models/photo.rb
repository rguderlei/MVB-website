class Photo < ActiveRecord::Base
  attr_accessible :image, :gallery_id
  belongs_to :gallery

  has_attached_file :image, :styles => {:small => "150x150>", :medium => "800x800"}
  # validates_attachment_presence :image
end
