class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.bigint :booking_number
      t.datetime :date_booked
      t.string :customer_name
      t.string :customer_address
      t.string :service_name
      t.float :service_price
      t.date :scheduled_date
      t.time :scheduled_time
      t.text :addon_names, default: [], array: true
      t.text :addon_prices, default: [], array: true
      t.float :amount
      t.string :status, default: "carted"

      t.timestamps
    end
  end
end
