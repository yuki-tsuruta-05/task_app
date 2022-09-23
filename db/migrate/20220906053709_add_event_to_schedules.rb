class AddEventToSchedules < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :all_day, :boolean, dfault: false, null: false
    add_column :schedules, :memo, :text
  end
end
