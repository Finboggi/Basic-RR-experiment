# frozen_string_literal: true

FactoryBot.define do
  factory :link do
    sequence(:url) { |i| "http://foo.bar/products/#{i}" }
    product
    shop
  end
end
