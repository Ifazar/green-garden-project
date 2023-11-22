class AddUserReferences < ActiveRecord::Migration[7.0]
  def change
    add_reference :gardens, :user, index: true
  end
end
