class Lift < ApplicationRecord
  acts_as_favoritable
  validates :lift_code, uniqueness: true
end
