FactoryBot.define do
  factory :order_shipping do
    token { 'tok_abcdefghijk00000000000000000' }
    post_code { '333-1234' }
    prefecture_id { 1 }
    city { '渋谷区' }
    address { '1-23-45' }
    building_name { 'アベノルカス' }
    tel_number { '08012345678' }
    # association :user
    # association :item
  end
end
