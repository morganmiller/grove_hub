class Algorithm < ApplicationRecord
  belongs_to :action_item

  validates :formula, presence: true
end
