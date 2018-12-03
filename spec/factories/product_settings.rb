# frozen_string_literal: true

FactoryBot.define do
  factory :product_settings, class: 'Product::Settings' do
    product
  end
end
