class Task < ActiveRecord::Base
  belongs_to :user
  validate :validate_assigned_user
  STATUS = ["New", "In Progress", "Completed"]

  def validate_assigned_user
    user = User.find(self.assigned_to_id)
    errors.add(:task, 'The assigned user does not exist') if user.nil?
  end

end
