class CreateTimeslots < ActiveRecord::Migration[7.0]
  def change
    create_table :timeslots do |t|
      t.time :available_time
      t.bigint :slots

      t.timestamps
    end
  end
end
