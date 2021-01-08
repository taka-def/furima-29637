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
    validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
    validates :state_id, numericality: { other_than: 1, message: "can't be blank" } 
    validates :delivery_fee_id, numericality: { other_than: 1, message: "can't be blank" } 
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" } 
    validates :day_id, numericality: { other_than: 1, message: "can't be blank" } 
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "is out of setting range" }
  end
end