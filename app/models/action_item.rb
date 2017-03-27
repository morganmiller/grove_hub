class ActionItem < ApplicationRecord
  belongs_to :category
  validates :category, presence: true

  has_many :algorithms, inverse_of: :action_item
  accepts_nested_attributes_for :algorithms
  validate :unique_algorithm_group

  validates :description, presence: true

  scope :category, -> (category_name) {
    joins(:category).where(categories: {name: category_name})
  }

  def unique_algorithm_group
    if duplicate_algorithm_groups?
      error_msg = "Can't have more than one algorithm within a certain group."
      errors.add(:algorithms, error_msg)
    end
  end

  private

  def algorithm_group_counts
    # Association proxy methods do not work here on 1st validation,
      # b/c it's before algorithms have saved to database
    self.algorithms
      .group_by { |obj| obj[:group] }
      .map { |k, v| [k,v.count] }
      .to_h rescue {}
  end

  def duplicate_algorithm_groups?
    algorithm_group_counts.any? {|k,v| v > 1 }
  end

end
