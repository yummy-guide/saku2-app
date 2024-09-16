class Store < ApplicationRecord
  has_one_attached :image
  has_one_attached :thumb

  validates :image,
            content_type: %i(gif png jpg jpeg),
            size: { less_than_or_equal_to: 2.megabytes },
            dimension: { width: { max: 4000 }, height: { max: 3000 } }

  validates :thumb,
            content_type: %i(gif png jpg jpeg),
            size: { less_than_or_equal_to: 500.kilobytes },
            dimension: { width: { max: 1000 }, height: { max: 1000 } }
end
