FactoryBot.define do
  factory :buy_item do
    title             { Faker::Name.name }
    content           { Faker::Lorem.sentence }
    category_id       { Faker::Number.within(range: 2..11) }
    item_status_id    { Faker::Number.within(range: 2..7) }
    shipping_days_id  { Faker::Number.within(range: 2..3) }
    shipping_fee_id   { Faker::Number.within(range: 2..4) }
    shipping_orig_id  { Faker::Number.within(range: 2..5) }
    price             { Faker::Number.within(range: 300..9_999_999) }

    association :user
  end
end
