class TextBlock < BaseBlock
  validates_presence_of :text

  enum text_size: {
    default: 0,
    large: 1
  }

  def self.permitted_params
    [:text, :text_size, :two_column]
  end

  def self.display_name
    'Text Block'
  end

  def self.display_icon
    'glyphicon glyphicon-align-left'
  end
end
