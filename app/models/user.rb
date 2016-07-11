class User < ActiveRecord::Base
  validates :name, uniqueness:true
  has_many :tasks
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  ROLES = ["Admin", "Staff"]

  def role?(role_name)
    role == role_name
  end

  def self.find_name_by_id(id)
    find(id).name
  end

end
