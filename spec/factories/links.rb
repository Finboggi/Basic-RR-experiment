FactoryBot.define do
  factory :link do
    sequence(:url) { |i| "http://foo.bar/products/#{i}" }

    product nil
    shop nil
  end
end
