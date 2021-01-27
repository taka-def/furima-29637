class Order
  include ActiveModel::Model
  attr_accessor :zip_code, :area_id, :city, :street_number, :building_name, :phone_number, :purchase_record_id, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :zip_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "Zip code input correctly" }
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street_number
    validates :phone_number, length: { maximum: 11 }, format: { with: /\A\d{11}\z/, message: "Phone number input only number" }
  end
  def save
   purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
   Address.create( purchase_record_id: purchase_record.id, zip_code: zip_code, area_id: area_id, city: city, street_number: street_number, phone_number: phone_number, building_name: building_name)

  end
end