# frozen_string_literal: true

require 'm3ta/railtie'

module M3ta
  extend ActiveSupport::Autoload

  autoload :Builder
  autoload :Controller
  autoload :Helpers
  autoload :Version

  class << self
    def defaults(&block)
      @defaults ||= Builder.new(I18n.translate(:m3ta, default: {}))
      @defaults.tap { |b| b.apply(&block) if block_given? }
    end
  end
end
