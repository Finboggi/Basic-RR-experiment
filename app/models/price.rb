# frozen_string_literal: true

class Price < ApplicationRecord
  belongs_to :link

  validates_presence_of :link
end
