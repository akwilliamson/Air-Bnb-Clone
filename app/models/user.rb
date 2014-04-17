class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: '250x250>', large: '400x400>' }
  do_not_validate_attachment_file_type :avatar
  has_many :listings
  has_many :bookings
end
