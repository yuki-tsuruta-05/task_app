class ChangeDataStartdayToSchedules < ActiveRecord::Migration[6.1]
  def change
    change_column :schedules, :start_day, :date
    change_column :schedules, :end_day, :date
    
  end
end
