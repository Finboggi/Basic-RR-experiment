FactoryBot.define do
  factory :shop do
    sequence(:url) { |i| "http://foo-#{i}.bar/" }
    sequence(:name) { |i| "foo-#{i} shop" }

    trait :ulmart do
      after :build do |shop|
        shop.name = 'Ulmart'
        shop.url = 'https://www.ulmart.ru/'
      end
    end
  end
end
