class Photo < ActiveRecord::Base
    attr_accessible :name, :gallery_id
    belongs_to :gallery
    validates_associated :gallery

    has_attached_file :image, :styles => { :thumb=>"100x100", :medium=>"800x800>"}
    validates_attachment_presence :image
end
