FactoryBot.define do
  factory :item_order do
    token          { 'tok_abcdefghijk00000000000000000' }
    postal         { '111-1111' }
    city           { '焼津市' }
    address        { '駅南2-2-2' }
    prefecture_id  { '2' }
    building       { 'サンダル' }
    phone          { '09012345678' }
  end
end
