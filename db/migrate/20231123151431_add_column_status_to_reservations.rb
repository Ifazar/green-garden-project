# frozen_string_literal: true

class AddColumnStatusToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :status, :string
  end
end
