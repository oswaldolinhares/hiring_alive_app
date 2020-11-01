# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    manufacturer { Faker::Company.name }
    model { Faker::Name.name }
    color { Faker::Color.color_name }
    carrier_plan_type { Product.carrier_plan_types.keys.sample }
    quantity { Faker::Number.within(range: 1..10) }
    price { Faker::Number.decimal(l_digits: 2) }
  end
end
