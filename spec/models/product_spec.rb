# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { create :product }

  describe '#prices' do
    describe 'returns list of links related to user\'s products' do
      let(:link) { create :link, product: product }
      let!(:price) { create :price, link: link }
      let!(:price_other_product) { create :price }

      it { expect(product.prices).to contain_exactly(price) }
    end
  end
end
