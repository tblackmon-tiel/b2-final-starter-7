class BulkDiscount < ApplicationRecord
  validates :percent, presence: true, numericality: true
  validates :quantity, presence: true, numericality: true

  belongs_to :merchant
end