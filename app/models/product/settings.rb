# frozen_string_literal: true

class Product
  class Settings < ApplicationRecord
    belongs_to :product
  end
end
