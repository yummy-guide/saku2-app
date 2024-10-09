class Coupon < ApplicationRecord
  belongs_to :store

  after_initialize :set_defaults, unless: :persisted?

  private

  def set_defaults
    self.seats ||= 1
    self.active ||= true
  end
end
