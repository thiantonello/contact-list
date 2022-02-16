# frozen_string_literal: true

class AddUniqueIndexes < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :username, unique: true
    add_index :contacts, %i[user_id name], unique: true
    add_index :phone_numbers, %i[contact_id phone_number], unique: true
  end
end
