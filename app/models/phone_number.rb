# frozen_string_literal: true

class PhoneNumber < ApplicationRecord
  belongs_to :contact

  validates :phone_number, presence: true, uniqueness: { scope: :contact_id }
  validates :label, presence: true
  validates :primary, presence: true
  validate :validate_only_one_phone_number_is_primary

  before_save :ensure_only_one_phone_number_is_primary

  private

  def ensure_only_one_phone_number_is_primary
    return unless :primary?
      contact.phone_numbers.update_all(primary: false)
  end

  def validate_only_one_phone_number_is_primary
    primary_counter = 0
    contact.phone_numbers.each do | phone_number |
      if phone_number.primary?
        primary_counter += 1
      end
    end
    if primary_counter > 1
      errors.add(:primary, "can only be true for one phone number")
    end
  end
end
