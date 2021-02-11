class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :buyer

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    with_options numericality: { other_than: 1, message:"Select" } do
      validates :category_id
      validates :state_id
      validates :burden_id
      validates :area_id
      validates :scheduled_date_id
    end
    validates :price, format: { with: /\A[0-9]+\z/ }
    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'is invalid' }
  end
  #   validates :item_id, numericality: { other_than: 1 }
  #   validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :area_id, numericality: { other_than: 0, message: "can't be blank" }
  
end