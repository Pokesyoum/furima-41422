class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :order
  validates  :postal_code,  presence: true
  validates  :area_id,      numericality: { other_than: 1, message: "can't be blank" }
  validates  :city,         presence: true
  validates  :street,       presence: true
  validates  :phone_number, presence: true
end
