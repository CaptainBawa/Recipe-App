class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  validates :name, :price, :quantity, :measurement_unit, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
