FactoryBot.define do
  factory :product do
    title 'hello'
    description '111111111111'
    price 12
    category_id { create(:category).id }
  end
end
