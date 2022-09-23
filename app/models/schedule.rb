class Schedule < ApplicationRecord
  validates :title, presence: true, length: {maximum: 20}
  validates :start_day, presence: true
  validates :end_day, presence: true
  validate :start_check
  validate :start_end_check

  def start_check
    unless start_day.nil? && end_day.nil?
      if start_day < Date.today
        errors.add(:start_day,"は本日以降の日付を登録してください")
      end
    end
  end

  def start_end_check
    unless start_day.nil? && end_day.nil?
      if self.end_day < self.start_day
        errors.add(:end_day,"は開始日より前の日付を登録できません")
      end
    end
  end

end