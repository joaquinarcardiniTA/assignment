# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, :type, :password, presence: true
  enum status: {'student': 'Student','teacher': 'Teacher'} #different types of users
end
