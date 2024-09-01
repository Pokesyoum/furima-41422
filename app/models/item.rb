class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :fee
  belongs_to :area
  belongs_to :day
  has_one_attached :image
  validates :user_id,     presence: true
  validates :item_name,   presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id,   numericality: { other_than: 1, message: "can't be blank" }
  validates :fee_id,      numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id,     numericality: { other_than: 1, message: "can't be blank" }
  validates :day_id,      numericality: { other_than: 1, message: "can't be blank" }
  validates :price,       numericality: {
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999,
    only_integer: true
  }
  validates :image, attached: true
end
