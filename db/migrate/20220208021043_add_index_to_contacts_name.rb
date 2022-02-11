# frozen_string_literal: true

class AddIndexToContactsName < ActiveRecord::Migration[6.1]
  def change
    add_index :contacts, :name, unique: true
  end
end
