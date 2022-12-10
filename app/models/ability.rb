class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    return unless user.present?

    can :manage, Group, author_id: user.id
    can :manage, Entity, author_id: user.id
  end
end
