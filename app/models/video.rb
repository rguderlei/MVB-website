class Video < ApplicationRecord

  has_attached_file :original
  #, :path => "videos/:original/:id.:extension",

end
