class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :dinosaur, null: false, foreign_key: true
      t.datetime :start_date
      t.datetime :end_time
      t.integer :booking_price
      t.string :status, default: "pending"

      t.timestamps
    end
  end
end
