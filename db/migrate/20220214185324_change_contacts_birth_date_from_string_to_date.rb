# frozen_string_literal: true

class ChangeContactsBirthDateFromStringToDate < ActiveRecord::Migration[6.1]
  def change
    change_column :contacts, :birth_date, :date
  end
end
