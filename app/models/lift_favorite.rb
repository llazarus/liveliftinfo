class LiftFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :lift
end
