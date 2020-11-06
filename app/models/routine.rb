class Routine < ApplicationRecord
  validates :title, {
      presence: true
  }
end
