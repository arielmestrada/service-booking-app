class AddTimeStringToTimeslots < ActiveRecord::Migration[7.0]
  def change
    add_column :timeslots, :time_string, :string
  end
end
