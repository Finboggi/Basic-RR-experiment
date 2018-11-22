# frozen_string_literal: true

class Link < ApplicationRecord
  belongs_to :product
  belongs_to :shop
  has_many :prices, dependent: :destroy

  validates_presence_of :product
end
