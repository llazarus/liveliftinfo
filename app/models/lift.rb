class Lift < ApplicationRecord
  validates :lift_code, uniqueness: true
end
