class QuoteBlock < BaseBlock
  def self.permitted_params
    [:quote, :quote_source]
  end

  def self.display_name
    'Quote Block'
  end

  # def self.display_icon
  #   'glyphicon glyphicon-align-left'
  # end
end
