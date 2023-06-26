class Cow < ApplicationRecord
  validates :numbers, presence: true

  def years_and_month_from_birthday
    now = Time.zone.now
    years = now.year - self.birth_day.year
    months = now.month - self.birth_day.month

    if now.month < self.birth_day.month || (now.month == self.birth_day.month && now.day < self.birth_day.day)
      years -= 1
      months = 12 + months - 1
    end

    "#{years}年#{months}ヶ月"
  end

end
