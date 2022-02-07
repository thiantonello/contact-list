# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :user
  has_many :phone_numbers

  validates :name, presence: true, uniqueness: { scope: :user_id }

  validates_associated :phone_numbers
end
