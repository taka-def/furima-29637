class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  has_one :purchase
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :day

  with_options presence: true do
    validates :image
    validates :products_name
    validates :text
  with_options numericality: { other_than: 1, message: "can't be blank" }  do
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
    validates :area_id
    validates :day_id
  end
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "is out of setting range" }
  end
end