# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@rr-experiment.com" }
    password { '_password_' }
    password_confirmation { '_password_' }
  end
end
