class Alert < ApplicationRecord
  validates :lift_code, uniqueness: true
end
