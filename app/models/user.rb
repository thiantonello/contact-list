# frozen_string_literal: true

class User < ApplicationRecord
  has_many :contacts

  validates :username, presence: true, uniqueness: true

  validates_associated :contacts
end
