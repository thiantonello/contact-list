# frozen_string_literal: true

class PhoneNumber < ApplicationRecord
  belongs_to :contact

  validates :phone_number, presence: true, uniqueness: { scope: :contact_id }
  validates :label, presence: true
  validates :primary, presence: true
end
