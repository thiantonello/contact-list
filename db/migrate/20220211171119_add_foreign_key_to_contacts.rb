# frozen_string_literal: true

class AddForeignKeyToContacts < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :contacts, :users
  end
end
