FactoryGirl.define do
  factory :user do
      name { Faker::Name.name }
      email { Faker::Internet.email }
    end

  factory :item do
    name { Faker::Hipster.word}
    description { Faker::Hipster.sentence }
    image_url { Faker::Placeholdit.image }
  end

  factory :order do
    amount { Faker::Commerce.price }
    user
  end

  factory :order_item do
    order
    item
  end
end
