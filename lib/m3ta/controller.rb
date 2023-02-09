# frozen_string_literal: true

module M3ta
  module Controller
    extend ActiveSupport::Concern

    included do
      class_attribute :_m3ta, default: M3ta.defaults.clone

      def self.m3ta(&block)
        _m3ta.apply(&block)
      end

      def m3ta(&block)
        @m3ta ||= self.class.m3ta.clone
        @m3ta.apply(&block)
      end
      helper_method :m3ta
    end
  end
end
