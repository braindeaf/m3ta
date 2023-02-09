# frozen_string_literal: true

module M3ta
  module Helpers
    def meta_tags
      [
        meta_tag(property: 'fb:app_id', content: m3ta.fb_app_id || '1434650413476851'),
        twitter_card,
        meta_tag(name: 'twitter:site', content: m3ta.twitter),
        meta_tag(name: 'twitter:creator', content: m3ta.twitter),
        meta_tag(property: 'og:type', content: m3ta.type || 'website'),
        meta_tag(property: 'og:site_name', content: site_name),
        meta_tag(property: 'og:url', content: url),
        tag(:link, rel: 'canonical', href: url),
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
        meta_tag(name: 'title', content: m3ta.title),
        meta_tag(property: 'og:title', content: m3ta.title),
        meta_tag(name: 'twitter:title', content: m3ta.title)
      ]
    end

    def twitter_card
      card = m3ta.player.present? ? 'player' : 'summary_large_image'
      meta_tag(name: 'twitter:card', content: card)
    end

    def player_tags
      return unless m3ta.player.present?

      [
        meta_tag(name: 'twitter:player', content: m3ta.player),
        meta_tag(name: 'twitter:player:width', content: '1280'),
        meta_tag(name: 'twitter:player:height', content: '720')
      ]
    end

    def keywords_tags
      return unless keywords.present?

      meta_tag(name: 'keywords', content: keywords)
    end

    def image_tags
      return unless m3ta.image

      [
        meta_tag(property: 'og:image', content: m3ta.image),
        meta_tag(name: 'twitter:image:src', content: m3ta.image)
      ]
    end

    def video_tags
      return unless m3ta.video

      [
        meta_tag(property: 'og:video:url', content: m3ta.video),
        meta_tag(property: 'og:video:secure_url', content: m3ta.video),
        meta_tag(property: 'og:video:width', content: m3ta.video_width),
        meta_tag(property: 'og:video:height', content: m3ta.video_height),
        meta_tag(property: 'og:video:type', content: m3ta.video_type)
      ]
    end

    def description_tags
      [
        meta_tag(name: 'description', content: m3ta.description),
        meta_tag(property: 'og:description', content: m3ta.description),
        meta_tag(name: 'twitter:description', content: m3ta.description)
      ]
    end

    def keywords
      @keywords ||= Array[m3ta.keywords,
                          I18n.t('meta.keywords', default: '')].flatten.select(&:present?).map do |section|
        section.to_s.split(',')
      end.flatten.select(&:present?).map(&:strip).uniq.join(', ')
    end

    def site_name
      m3ta.site_name || t('site_name')
    end

    def url
      (m3ta.url || request.url).split('?')[0]
    end

    def meta_tag(options = {})
      tag(:meta, options)
    end
  end
end
