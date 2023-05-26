class Currency < ApplicationRecord
  has_paper_trail
  validates :name, presence: true
  validates :rate, presence: true, numericality: { greater_than: 0 }
end