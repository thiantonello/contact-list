# frozen_string_literal: true

class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name, null: false, unique: true
      t.string :birth_date
      t.timestamps
    end
  end
end
