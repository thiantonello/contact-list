# frozen_string_literal: true

class PhoneNumber < ApplicationRecord
  belongs_to :contact

  validates :phone_number, presence: true
  validates :label, presence: true
  validates :primary, presence: true, inclusion: { in: [true, false] }
  validates :contact_id, uniqueness: { scope: :contact_id }
end
