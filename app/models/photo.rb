class Photo < ActiveRecord::Base
  attr_accessible :image, :gallery_id
  belongs_to :gallery

  has_attached_file :image, :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      :url => "/system/:attachment/:id/:style/:filename", :styles => {:small=>"90x90#", :medium => "210x150#", :large => "320x230#", :xlarge => "800x800"}
  # validates_attachment_presence :image
end
