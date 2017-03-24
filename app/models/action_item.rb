class ActionItem < ApplicationRecord
  belongs_to :category
  validates :category, presence: true

  has_one :algorithm

  validates :description, presence: true

  scope :category, -> (category_name) { joins(:category).where(categories: {name: category_name}) }

end
