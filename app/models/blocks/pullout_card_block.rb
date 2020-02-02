class PulloutCardBlock < BaseBlock
  validates_presence_of :text

  enum text_size: {
    default: 0,
    large: 1
  }

  def self.permitted_params
    [:text, :text_size]
  end

  def self.display_name
    'Pullout Card Block'
  end

  def self.display_icon
    'glyphicon glyphicon-align-left'
  end
end
