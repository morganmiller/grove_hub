class ActionItem < ApplicationRecord
  belongs_to :category
  validates :category, presence: true

  validates :description, presence: true

  scope :category, -> (category_name) { joins(:category).where(categories: {name: category_name}) }
  
end
