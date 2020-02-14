require 'redcarpet/render_strip'

module MarkdownHelper
  def md(text)
    parser.render(text.to_s).gsub(/\[MEDIA_ITEM=(\d*)\]/) do |media_item_id_match|
      media_item_id = media_item_id_match.match(/\[MEDIA_ITEM=(\d*)\]/)[1]
      media_item = MediaItem.where(id: media_item_id).first
      if media_item.present?
        image_tag(media_item.attachment.url(:small), class: 'md-image')
      else
        ''
      end
    end.html_safe
  end

  def stripdown(text)
    stripper.render(text.to_s).squish
  end

  private

    def parser
      @parser ||= Redcarpet::Markdown.new(renderer, Forest::MarkdownRenderer.options)
    end

    def stripper
      @stripper ||= Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
    end

    def renderer
      @renderer ||= Forest::MarkdownRenderer.new(Forest::MarkdownRenderer.render_options)
    end
end
