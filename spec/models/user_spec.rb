# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create :user }

  describe '#links' do
    describe 'returns list of links related to user\'s products' do
      let(:product) { create :product, user: user }
      let(:link) { create :link, product: product }
      let(:link_other_user) { create :link }

      it { expect(user.links).to contain_exactly(link) }
    end
  end
end
