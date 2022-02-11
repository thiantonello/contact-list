# frozen_string_literal: true

class AddIndexToPhoneNumbersPhoneNumber < ActiveRecord::Migration[6.1]
  def change
    add_index :phone_numbers, :phone_number, unique: true
  end
end
