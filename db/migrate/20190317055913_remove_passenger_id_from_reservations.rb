class RemovePassengerIdFromReservations < ActiveRecord::Migration[5.2]
  def change
    remove_column :reservations, :passenger_id
  end
end
