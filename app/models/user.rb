class User < ActiveRecord::Base
  # mount_uploader :profile_photo, ProfilePhotoUploader
  has_many :memberships
  has_many :timelines, through: :memberships

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   validates :first_name, presence: true
   validates :last_name, presence: true
   validates :email, presence: true
end
