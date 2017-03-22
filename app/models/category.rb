class Category < ApplicationRecord
  has_many :action_items

  validates :name, presence: true
  
end
