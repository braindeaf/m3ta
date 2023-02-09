# frozen_string_literal: true

require 'hashie'

module M3ta
  class Builder < Hashie::Dash
    # Core
    property :site_name
    property :type
    property :title
    property :description
    property :url
    property :image
    property :keywords
    property :player
    property :video

    # Social
    property :facebook_app_id
    property :twitter_handle

    def apply(attributes = {}, &block)
      merge!(attributes)
      block.call(self) if block_given?
      self
    end
  end
end
