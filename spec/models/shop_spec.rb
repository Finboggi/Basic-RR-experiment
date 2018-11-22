# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Shop, type: :model do
  describe '#parse_value_from_html' do
    context 'when html code of product page for Ulmart shop passed' do
      let(:html_content) { File.read('spec/fixtures/ulmart_product_page.html') }
      let(:shop) { create :shop, :ulmart }
      let(:value) { shop.parse_value_from_html(html_content) }

      it { expect(value).to eq 36_890.0 }
    end
  end
end
