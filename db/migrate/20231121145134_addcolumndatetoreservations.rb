# frozen_string_literal: true

class Addcolumndatetoreservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :date, :date
  end
end
