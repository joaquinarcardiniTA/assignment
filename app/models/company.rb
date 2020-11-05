# frozen_string_literal: true

class Company < ApplicationRecord
	validates :name, :country, presence: true
	belongs_to :student
	has_many :cash_managements
  validates :name, :uniqueness => true

  #class method to find list of companies
	def self.list(user)
  	if user.is_a? Teacher
  		Company.all #if a user is teacher then return all the company
  	elsif user.is_a? Student
  	  user.companies #if a user is student then return all his/her company only
  	end
  end
end
