# frozen_string_literal: true

class AddForeignKeyToPhoneNumbers < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :phone_numbers, :contacts
  end
end
