# frozen_string_literal: true

class CreateGardens < ActiveRecord::Migration[7.0]
  def change
    create_table :gardens do |t|
      t.string :name
      t.string :address
      t.string :detail
      t.string :tool
      t.string :picture
      t.integer :price
      t.date :date

      t.timestamps
    end
  end
end
