# frozen_string_literal: true

class ChangePhoneNumbersLabelFromStringToInteger < ActiveRecord::Migration[6.1]
  def change
    change_column :phone_numbers, :label, :integer
  end
end
