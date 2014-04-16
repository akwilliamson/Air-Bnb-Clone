class Listing < ActiveRecord::Base
  belongs_to :user
  do_not_validate_attachment_file_type :photo
  has_attached_file :photo, styles: { small: '100x100>', medium: '250x250>', large: '400x400>' }


end
