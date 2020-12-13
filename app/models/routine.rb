class Routine < ApplicationRecord
  validates :user_id, {
      presence: true,
      numericality: { only_integer: true }
  }

  validates :title, {
      presence: true,
      length: {minimum: 1, maximum: 30}
  }

  validates :content, {
      presence: false,
      length: {minimum: 0, maximum: 500}
  }

  validates :limit_time, {
      presence: false,
  }
end
