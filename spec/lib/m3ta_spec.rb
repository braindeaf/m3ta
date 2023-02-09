# frozen_string_literal: true

require 'rails_helper'

RSpec.describe M3ta do
  describe '.defaults' do
    it 'sets default M3ta::Builder instance variable' do
      expect(M3ta.instance_variable_get(:'@defaults')).to be_empty
      M3ta.defaults do |b|
        b.title = 'Title'
      end
      expect(M3ta.instance_variable_get(:'@defaults')).not_to be_empty
      expect(M3ta.instance_variable_get(:'@defaults')).to eq(title: 'Title')
    end
  end
end
