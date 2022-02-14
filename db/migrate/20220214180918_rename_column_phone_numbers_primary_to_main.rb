# frozen_string_literal: true

class RenameColumnPhoneNumbersPrimaryToMain < ActiveRecord::Migration[6.1]
  def change
    rename_column :phone_numbers, :primary, :main
  end
end
