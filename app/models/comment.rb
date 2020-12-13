class Comment < ApplicationRecord
  validates :comment_type, {
      presence: true,
      numericality: { only_integer: true },
      length: {minimum: 1, maximum: 1}
  }

  validates :type_id, {
      presence: true,
      numericality: { only_integer: true }
  }

  validates :comment, {
      presence: true,
      length: {minimum: 0, maximum: 500}
  }
end
