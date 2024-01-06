FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    description { Faker::Marketing.buzzwords }
    price { Faker::Commerce.price }
    category
  end
end
