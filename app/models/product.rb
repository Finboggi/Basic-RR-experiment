# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :links, dependent: :destroy
  has_one :settings, class_name: 'Product::Settings'
  belongs_to :user

  validates_presence_of :user

  accepts_nested_attributes_for :settings

  def prices
    Price.where(link: links)
  end
end
