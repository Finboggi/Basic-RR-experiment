FactoryBot.define do
  factory :price do
    sequence(:url) { |i| "http://foo-#{i}.bar/" }

    parsed_at "2017-11-12 14:55:59"
    value 1.5
  end
end
