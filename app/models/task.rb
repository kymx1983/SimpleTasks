class Task < ApplicationRecord
  validates :title, {
      presence: true,
      length: {minimum: 1, maximum: 30}
  }

  validates :content, {
      presence: false,
      length: {minimum: 0, maximum: 500}
  }

  validates :limit_date, {
      presence: false,
  }

  validates :status, {
      presence: true,
      length: {minimum: 1, maximum: 1}
  }

  validates :limit_time, {
      presence: false,
  }

  def get_status
    case status
    when 0 then
      "未完了"
    when 1 then
      "完了"
    else
      "その他"
    end
  end
end
