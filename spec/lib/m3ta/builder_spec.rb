require 'rails_helper'

RSpec.describe M3ta::Builder do
  subject { build(:builder) }

  describe 'attributes' do
    it 'only copes with standard attributes' do
      expect do
        described_class.new(fake: 'fake')
      end.to raise_error(NoMethodError, "The property 'fake' is not defined for M3ta::Builder.")
    end

    it 'copes with pre-defined attributes' do
      %i[
        site_name type title description url image keywords
        player video facebook_app_id twitter_handle
      ].each do |attr|
        expect(subject[attr]).not_to be_nil
      end
    end
  end
end