class BuyerAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :municipality, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :token
    validates :area_id, numericality: { other_than: 1 } 
    validates :municipality
    validates :address
    validates :phone_number, numericality: { only_integer: true }, length: { in: 10..11 }
  end

  def save
    buyer = Buyer.create(
      item_id: item_id,
      user_id: user_id
    )

    address = Address.new(
      buyer_id: buyer.id,
      postal_code: postal_code,
      area_id: area_id,
      municipality: municipality,
      address: address,
      building: building,
      phone_number: phone_number
    )
  end
end
