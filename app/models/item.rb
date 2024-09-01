class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :fee
  belongs_to :area
  belongs_to :day
  has_one_attached :image
  validates :image, attached: true
end
