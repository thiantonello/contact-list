# frozen_string_literal: true

class AddUserIdToContacts < ActiveRecord::Migration[6.1]
  def change
    add_reference :contacts, :user, null: false, foreign_key: true
  end
end
