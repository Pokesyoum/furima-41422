class OrderAddressForm
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :token, :postal_code, :area_id, :city, :street, :building, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code,  format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid' }
    validates :area_id,      numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
    validates :token
  end

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
