# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { 'MyProductName' }
    user
  end
end
