# frozen_string_literal: true

class CreatePhoneNumbers < ActiveRecord::Migration[6.1]
  def change
    create_table :phone_numbers do |t|
      t.string :phone_number, null: false, unique: true
      t.string :label, null: false
      t.boolean :primary, null: false, default: false
      t.timestamps
    end
  end
end
