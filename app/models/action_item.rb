class ActionItem < ApplicationRecord
  belongs_to :category
  validates :category, presence: true
  
end
