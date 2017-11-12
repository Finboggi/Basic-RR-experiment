require 'rails_helper'

RSpec.describe UpdatePriceForLinkJob do
  describe '#perform' do
    let(:perform) { described_class.new.perform(link) }
    let(:shop) { create :shop, :ulmart }
    let(:link) { create :link, shop: shop }
    let(:response) { File.read('spec/fixtures/ulmart_product_page.html') }

    let!(:product_request) {
      stub_request(:get, link.url).to_return(status: 200, body: response)
    }

    describe 'getting product page html' do
      before { perform }

      it { expect(product_request).to have_been_requested }
    end

    describe 'creates new Price' do
      it { expect { perform }.to change{ link.prices.reload.size }.by(1) }
    end
  end
end
