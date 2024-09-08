class OrderAddressForm
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :token, :postal_code, :area_id, :city, :street, :building, :phone_number

  validates  :postal_code,  presence: true
  validates  :area_id,      numericality: { other_than: 1, message: "can't be blank" }
  validates  :city,         presence: true
  validates  :street,       presence: true
  validates  :phone_number, presence: true

  def save
    return false unless valid?

    ActiveRecord::Base.transaction do
      order = Order.create!(
        user_id:,
        item_id:
      )

      Address.create!(
        order_id: order.id,
        postal_code:,
        area_id:,
        city:,
        street:,
        building:,
        phone_number:
      )
    end
    true
  rescue StandardError => e
    Rails.logger.error("Failed to save OrderAddressForm: #{e.message}")
    false
  end
end
