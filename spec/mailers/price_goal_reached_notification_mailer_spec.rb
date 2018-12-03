# frozen_string_literal: true

require 'rails_helper'

describe PriceGoalReachedNotificationMailer, type: :mailer do
  describe '#fixed_goal' do
    let(:mail) { described_class.fixed_goal(user, product, product_shop_url, price_value) }
    let(:user) { build :user, email: 'fixed_goal@example.com' }

    let(:product) { build_stubbed :product, name: 'Some ProductName' }
    let!(:product_settings) { build_stubbed :product_settings, product: product, price_limit: 10_999.99 }
    let(:product_shop_url) { 'shop-url.example.com' }
    let(:price_value) { 10_000.10 }

    describe 'headers' do
      it { expect(mail[:to].to_s).to eq 'fixed_goal@example.com' }
      it { expect(mail.subject).to eq 'The price dropped below predetermined limit' }
    end

    describe 'body' do
      let(:body) { Capybara::Node::Simple.new(mail.body.to_s) }
      let(:shop_link_href) { body.find('.cc-shop-link')[:href] }

      it do
        expect(body).to have_css(
          '.cc-description',
          text: 'The Some ProductName`s price drop below 10999.99 reaching a low of 10000.10'
        )
      end

      it { expect(body).to have_css('.cc-product-management-link', text: 'Go to the monitoring management page') }
      it { expect(body).to have_css('.cc-shop-link', text: 'Go to the product page in the store') }
      it { expect(shop_link_href).to eq product_shop_url }
    end
  end
end
