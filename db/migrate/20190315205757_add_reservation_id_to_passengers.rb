class AddReservationIdToPassengers < ActiveRecord::Migration[5.2]
  def change
    add_column :passengers, :reservation_id, :integer
  end
end
