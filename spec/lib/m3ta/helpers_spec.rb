# frozen_string_literal: true

require 'rails_helper'

RSpec.describe M3ta::Helpers, type: :helper do
  let(:m3ta) { build(:builder) }

  before do
    allow(helper).to receive(:m3ta).and_return(m3ta)
  end

  describe '.meta_tag' do
    it 'returns a <meta /> tag' do
      expect(helper.m3ta_tag).to eq('<meta />')
    end
  end

  describe '.m3ta_tags' do
    it 'returns a string of all tags' do
      expect(helper.m3ta_tag).to include('meta')
    end
  end
end
