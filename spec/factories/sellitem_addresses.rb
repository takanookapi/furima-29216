FactoryBot.define do
  factory :sellitem_address do
    postal_code { '111-1111' }
    shipping_orig_id { 2 }
    city            { 'hoge' }
    address_other   { 'hoge' }
    telephone_num   { '0120444444' }
    token           { 'tok_000ff0f0a0a0f000cf000ec0edf0' }
  end
end
