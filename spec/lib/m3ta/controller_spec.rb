require 'rails-controller-testing'
require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  let(:controller) do
    Class.new(ApplicationController) do
      m3ta do |b|
        b.title = 'Title'
        b.description = 'Description'
      end

      def index
        m3ta.title = 'Title Updated'
      end
    end
  end

  it 'has a M3ta::Builder class object' do
    expect(controller.m3ta).to be_a(M3ta::Builder)
    expect(controller.m3ta.title).to eq('Title')
    expect(controller.m3ta.description).to eq('Description')
  end

  it 'has a M3ta::Builder instance object' do
    instance = controller.new
    expect(instance.m3ta).to be_a(M3ta::Builder)
    expect(instance.m3ta.title).to eq('Title')
    expect(instance.m3ta.description).to eq('Description')
  end

  it 'allows M3ta::Builder instance object to be modified' do
    instance = controller.new
    instance.index
    expect(instance.m3ta).to be_a(M3ta::Builder)
    expect(instance.m3ta.title).to eq('Title Updated')
    expect(instance.m3ta.description).to eq('Description')
  end

  describe 'subclass' do
    let(:controller) do
      Class.new(super()) do
        m3ta do |b|
          b.title = 'Title'
          b.description = 'Description 2'
        end
      end
    end

    it 'has a M3ta::Builder class object that extends the superclass M3ta::Builder object' do
      expect(controller.m3ta).to be_a(M3ta::Builder)
      expect(controller.m3ta.title).to eq('Title')
      expect(controller.m3ta.description).to eq('Description 2')
    end

    it 'has a M3ta::Builder instance object that extends the superclass M3ta::Builder object' do
      instance = controller.new
      expect(instance.m3ta).to be_a(M3ta::Builder)
      expect(instance.m3ta.title).to eq('Title')
      expect(instance.m3ta.description).to eq('Description 2')
    end

    it 'allows M3ta::Builder instance object to be modified' do
      instance = controller.new
      instance.index
      expect(instance.m3ta).to be_a(M3ta::Builder)
      expect(instance.m3ta.title).to eq('Title Updated')
      expect(instance.m3ta.description).to eq('Description 2')
    end
  end
end