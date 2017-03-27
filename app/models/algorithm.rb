class Algorithm < ApplicationRecord
  belongs_to :action_item

  validates :formula, presence: true
  validates :group, presence: true

  enum group: [
    "Carbon Saved",
    "Water Saved"
  ]
end
