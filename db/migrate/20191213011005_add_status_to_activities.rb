class AddStatusToActivities < ActiveRecord::Migration[5.2]
  def change
    add_reference :activities, :status, foreign_key: true
  end
end
