# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

#     if user.retailer?
#       can :search, Product
#       can :import, Product
#       can :manage, Product, user_id: user.id
#     end

#     if user.supplier?
#       can :manage, Product, user_id: user.id
#     end
  end
end
