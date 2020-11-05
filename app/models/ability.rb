# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      if user.is_a? Teacher
        can :read, Company        #allow teacher to read all the companies
        can :read, CashManagement #allow teacher to read all the cash_managements
      elsif user.is_a? Student
        can [:read, :create, :update, :destroy], Company, student_id: user.id #allow student to manage companies
        can [:read, :create, :update, :destroy], CashManagement #allow student to manage cash_managements
      end
    end
  end
end
