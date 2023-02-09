# frozen_string_literal: true

require 'rails_helper'

RSpec.describe M3ta::Helpers, type: :helper do
  let(:m3ta) { build(:builder) }

  before do
    allow(helper).to receive(:m3ta).and_return(m3ta)
  end

  describe '.meta_tag' do
    it 'returns a <meta /> tag' do
      expect(helper.meta_tag).to eq('<meta />')
    end
  end
end
