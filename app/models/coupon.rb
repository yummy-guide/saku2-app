class Coupon < ApplicationRecord
  belongs_to :store

  after_initialize :set_defaults, unless: :persisted?

  validates :discount_amount, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  private

  def set_defaults
    self.seats ||= 1
    self.active ||= true
  end
end
