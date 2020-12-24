class Product < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :caregory_id
  belongs_to :state_id
  belongs_to :delivery_fee_id
  belongs_to :area_id
  belongs_to :days_id

  with_options presence: true do
    validates :products_name
    validates :text
    validates :caregory_id, numericality: { other_than: 1 } 
    validates :state_id, numericality: { other_than: 1 } 
    validates :delivery_fee_id, numericality: { other_than: 1 } 
    validates :area_id, numericality: { other_than: 1 } 
    validates :days_id, numericality: { other_than: 1 } 
    validates :price
  end
end
