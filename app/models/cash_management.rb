# frozen_string_literal: true

class CashManagement < ApplicationRecord
	belongs_to :company
	validates :initial_cash, :cash_out, :cash_in, presence: true, numericality: true
	scope :company_based, ->(company_id) { where(company_id: company_id) }

	#class method to find list of cash_management
	def self.list(user)
		if user.is_a? Teacher
  		CashManagement.includes(:company) #if user is a teacher return all the cash managements
  	elsif user.is_a? Student
  	  CashManagement.joins(company: :student).where("users.id = ?", user.id) #if user is a student return all his cash managements
  	end
	end
end
