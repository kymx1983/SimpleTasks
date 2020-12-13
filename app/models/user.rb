class User < ApplicationRecord
  validates :login_id, {
      presence: true,
      length: {minimum: 1, maximum: 30}
  }

  validates :password, {
      presence: true,
      length: {minimum: 1, maximum: 30}
  }

  validates :user_name, {
      presence: true,
      length: {minimum: 1, maximum: 30}
  }
end
