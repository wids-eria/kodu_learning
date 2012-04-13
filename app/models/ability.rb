class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Is this needed really?

    can :read_comments, Level do |level|
      can? :create_comment, level
    end

    can :create_comment, Level do |level|
      user.teacher? || user == level.user
    end

    if user.teacher?
      can :manage, Assignment
    else
      can :read, :all
    end
  end
end
