class AddReferencesReservationsToGarden < ActiveRecord::Migration[7.0]
  def change
    add_reference :gardens, :reservation, index: true
  end
end
