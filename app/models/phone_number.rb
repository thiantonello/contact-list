# frozen_string_literal: true

class PhoneNumber < ApplicationRecord
  belongs_to :contact

  validates :phone_number, presence: true, uniqueness: { scope: :contact_id }
  validates :label, presence: true
  enum label: { home: 0, work: 1, other: 2 }
  validates :main, inclusion: [true, false]
  validate :only_one_phone_number_is_main

  before_save :set_main_if_phone_numbers_is_empty
  before_save :ensure_only_one_phone_number_is_main

  private

  def only_one_phone_number_is_main
    return unless contact.phone_numbers.where(main: true).count > 1

    errors.add(:main, 'Only one phone_number can be main')
  end

  def ensure_only_one_phone_number_is_main
    return unless main?

    contact.phone_numbers.update_all(main: false)
  end

  def set_main_if_phone_numbers_is_empty
    return unless contact.phone_numbers.empty?

    self.main = true
  end
end
