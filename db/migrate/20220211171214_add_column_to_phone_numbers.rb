# frozen_string_literal: true

class AddColumnToPhoneNumbers < ActiveRecord::Migration[6.1]
  def change
    add_column :phone_numbers, :contact_id, :integer
  end
end
