FactoryBot.define do
  factory :order do

    zip_code      { "111-1111" }
    area_id       {2}
    city          {"市"}
    street_number {"青山１−１−１"}
    building_name {"建物"}
    phone_number  {"11111111111"}

  end
end
