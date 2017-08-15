class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :cities
         has_many :amenities
         belongs_to :role

         after_create :set_user_guest

         def set_user_guest
         	role = Role.first
         	self.role_id = role.id
         	self.save
         end

         def role?(role)
          self.role.name == role
         end
end
