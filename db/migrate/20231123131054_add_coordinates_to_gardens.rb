# frozen_string_literal: true

class AddCoordinatesToGardens < ActiveRecord::Migration[7.0]
  def change
    add_column :gardens, :latitude, :float
    add_column :gardens, :longitude, :float
  end
end
