class ActionItem < ApplicationRecord
  belongs_to :category
  validates :category, presence: true

  has_many :algorithms, inverse_of: :action_item
  accepts_nested_attributes_for :algorithms

  validates :description, presence: true

  scope :category, -> (category_name) { joins(:category).where(categories: {name: category_name}) }

end
