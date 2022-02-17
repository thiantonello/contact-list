# frozen_string_literal: true

class User < ApplicationRecord
  has_many :contacts
  has_many :phone_numbers, through: :contacts

  validates :username, presence: true, uniqueness: true
end
