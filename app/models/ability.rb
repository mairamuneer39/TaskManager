class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role?("Admin")
      can :manage, :all
    elsif user.role?("Staff")
      can [:show, :update, :start], Task, assigned_to_id: user.id
      can :end, Task, status: "In Progress", assigned_to_id: user.id
      can :index, Task, ['assigned_to_id = (?)', user.id] do
      end 
    end
  end

end

