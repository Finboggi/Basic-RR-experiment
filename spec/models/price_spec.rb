# frozen_string_literal: true

require 'rails_helper'

describe Price, type: :model do
  describe '#before_create hook' do
    describe 'user notification' do
      before { ActiveJob::Base.queue_adapter = :test }
      let(:link) { create :link }
      let!(:product_settings) { build_stubbed :product_settings, product: link.product, price_limit: 999.99 }
      let(:create_price) { create(:price, link: link, value: price_value) }
      let(:product) { link.product }
      let(:user) { link.product.user }
      let(:shop_url) { link.shop.url }

      context 'when price value is above desired limit' do
        let(:price_value) { 10_000 }

        describe 'not sending' do
          it { expect { create_price }.not_to have_enqueued_job }
        end
      end

      context 'when price value is above desired limit' do
        let(:price_value) { 100 }

        describe 'sending' do
          let(:mailer_class_name) { 'PriceGoalReachedNotificationMailer' }
          let(:mailer_method_name) { 'fixed_goal' }
          let(:call_type) { 'deliver_now' }

          it do
            expect { create_price }.to have_enqueued_job
              .with(mailer_class_name, mailer_method_name, call_type, user, product, shop_url, price_value)
          end
        end
      end
    end
  end
end
