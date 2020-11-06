class Task < ApplicationRecord
  validates :title, {
      presence: true
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
