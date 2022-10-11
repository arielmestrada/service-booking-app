class AddReferenceToModels < ActiveRecord::Migration[7.0]
  def change
    add_reference :services, :category, foreign_key: true
    add_reference :addons, :service, foreign_key: true
    add_reference :schedules, :service, foreign_key: true
    add_reference :timeslots, :schedule, foreign_key: true
    add_reference :booking_numbers, :user, foreign_key: true
    add_reference :payment_options, :user, foreign_key: true
  end
end
