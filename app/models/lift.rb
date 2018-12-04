class Lift < ApplicationRecord
  acts_as_favoritable
  has_many :statuses
  validates :lift_code, uniqueness: true
end
