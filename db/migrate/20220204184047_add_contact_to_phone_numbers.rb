# frozen_string_literal: true

class AddContactToPhoneNumbers < ActiveRecord::Migration[6.1]
  def change
    add_reference :phone_numbers, :contact, null: false, foreign_key: true
  end
end
