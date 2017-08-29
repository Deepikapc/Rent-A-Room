class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :cities
         belongs_to :role
         has_many :rooms
         has_many :bookings

         after_create :set_user_guest

         def set_user_guest
            guest_role = Role.find_by('name=?',"guest").id
            self.role_id = guest_role
            self.save 
         end

         def role?(role)
          self.role.name == role
         end
end
