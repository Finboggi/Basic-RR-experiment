FactoryBot.define do
  factory :link do
    sequence(:url) { |i| "http://foo.bar/products/#{i}" }

    association :product
    association :shop
  end
end
