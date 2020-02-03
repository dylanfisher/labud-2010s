module ImageVideoHelper
  def lazy_image(media_item, options = {})
    size = options.delete(:size) || :large
    data = options.delete(:data) || {}

    alt = options.delete(:alt) ||
          media_item.try(:alternative_text) ||
          media_item.try(:caption)

    options.merge!(alt: alt) if alt.present?

    styles = media_item.attachment.options[:styles]
    index = [styles.find_index { |k, v| k == size }, 2].max
    size_mobile = options.delete(:size_mobile) || styles.keys[index - 1]

    if media_item.try(:point_of_interest_x).present? && media_item.try(:point_of_interest_y).present?
      point_of_interest_x = options.fetch(:point_of_interest_x, media_item.point_of_interest_x)
      point_of_interest_y = options.fetch(:point_of_interest_y, media_item.point_of_interest_y)
      css_style = "background-position: #{point_of_interest_x}% #{point_of_interest_y}%;"
    end

    data.merge!(src: media_item.attachment.url(size),
                src_mobile: media_item.attachment.url(size_mobile),
                src_full: media_item.attachment.url(:medium),
                src_full_mobile: media_item.attachment.url(:large),
                caption: md(media_item.try(:caption)))

    if options.delete(:background)
      options.merge!('aria-label': alt) if alt.present?
      options.delete(:alt)
      content_tag :div,
                  nil,
                  class: "lazy-image lazy-image--background lazyload #{options.delete(:class)}",
                  style: css_style,
                  role: 'img',
                  data: {
                    bg: data.delete(:src),
                    bg_mobile: data.delete(:src_mobile),
                    **data
                  },
                  **options
    else
      image_jump_fix media_item, class: options.delete(:wrapper_class) do
        image_tag uri_image_placeholder, class: "lazy-image lazyload #{options.delete(:class)}", data: data, **options
      end
    end
  end

  def lazy_video(record, options = {})
    data = options.delete(:data) || {}
    autoplay = options.delete(:autoplay) || record.try(:autoplay)
    controls = options.fetch(:controls, !autoplay)
    video_loop = options.fetch(:loop, autoplay)
    video_tag_html = capture do
      video_tag '',
                class: "lazy-video #{options.delete(:class)}",
                controls: controls,
                playsinline: autoplay,
                autoplay: autoplay,
                muted: autoplay,
                loop: video_loop,
                data: {
                  src: (options.delete(:src) || record.try(:video_url)),
                  src_mobile: (options.delete(:src_mobile) || record.try(:video_url_mobile)),
                  **data },
                **options
    end

    content_tag :div, nil, class: 'lazy-video-placeholder', data: { video_tag_html: video_tag_html }
  end

  def missing_image(options = {})
    classes = ['missing-image']
    classes << options.delete(:class)
    content_tag :div, nil, class: classes.join(' '), **options
  end

  private

    def uri_image_placeholder
      'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='
    end
end
