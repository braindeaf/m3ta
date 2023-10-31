# frozen_string_literal: true

module M3ta
  module Helpers
    def m3ta_tags
      [
        facebook_tags,
        twitter_tags,
        m3ta_tag(property: 'og:type', content: m3ta.type || 'website'),
        m3ta_tag(property: 'og:site_name', content: site_name),
        m3ta_tag(property: 'og:url', content: canonical_url),
        tag(:link, rel: 'canonical', href: canonical_url),
        title_tags,
        description_tags,
        player_tags,
        image_tags,
        video_tags,
        keywords_tags
      ].flatten.compact.join("\n").html_safe
    end

    def title_tags
      [
        content_tag(:title, m3ta.title),
        m3ta_tag(name: 'title', content: m3ta.title),
        m3ta_tag(property: 'og:title', content: m3ta.title),
        m3ta_tag(name: 'twitter:title', content: m3ta.title)
      ]
    end

    def facebook_tags
      [
        m3ta.facebook_app_id.presence && m3ta_tag(property: 'fb:app_id', content: m3ta.facebook_app_id) 
      ]
    end

    def twitter_tags
      card = m3ta.player.present? ? 'player' : 'summary_large_image'
      [
        m3ta.twitter_handle.presence && m3ta_tag(name: 'twitter:site', content: m3ta.twitter_handle),
        m3ta.twitter_handle.presence && m3ta_tag(name: 'twitter:creator', content: m3ta.twitter_handle),
        m3ta_tag(name: 'twitter:card', content: card)
      ]
    end

    def player_tags
      return unless m3ta.player.present?

      [
        m3ta_tag(name: 'twitter:player', content: m3ta.player),
        m3ta_tag(name: 'twitter:player:width', content: '1280'),
        m3ta_tag(name: 'twitter:player:height', content: '720')
      ]
    end

    def keywords_tags
      return unless keywords.present?

      m3ta_tag(name: 'keywords', content: keywords)
    end

    def image_tags
      return unless m3ta.image

      [
        m3ta_tag(property: 'og:image', content: m3ta.image),
        m3ta_tag(name: 'twitter:image:src', content: m3ta.image)
      ]
    end

    def video_tags
      return unless m3ta.video

      [
        m3ta_tag(property: 'og:video:url', content: m3ta.video),
        m3ta_tag(property: 'og:video:secure_url', content: m3ta.video),
        m3ta_tag(property: 'og:video:width', content: m3ta.video_width),
        m3ta_tag(property: 'og:video:height', content: m3ta.video_height),
        m3ta_tag(property: 'og:video:type', content: m3ta.video_type)
      ]
    end

    def description_tags
      return unless m3ta.description
      
      [
        m3ta_tag(name: 'description', content: m3ta.description),
        m3ta_tag(property: 'og:description', content: m3ta.description),
        m3ta_tag(name: 'twitter:description', content: m3ta.description)
      ]
    end

    def keywords
      @keywords ||= Array[m3ta.keywords].flatten.select(&:present?).map do |section|
        section.to_s.split(',')
      end.flatten.select(&:present?).map(&:strip).uniq.join(', ')
    end

    def site_name
      m3ta.site_name
    end

    def canonical_url
      (m3ta.url || request.url).split('?')[0]
    end

    def m3ta_tag(options = {})
      tag(:meta, options)
    end
  end
end
