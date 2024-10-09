class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :coupon

  validates :seats, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
