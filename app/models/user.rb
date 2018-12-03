class User < ApplicationRecord
  acts_as_favoritor

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  before_validation :strip_non_numeric

  validates :phone, phone: { possible: true, types: :mobile, countries: [:us, :ca], sanitized: true }

  def strip_non_numeric
    self.phone = phone.gsub(/\D/, '')
  end

end
