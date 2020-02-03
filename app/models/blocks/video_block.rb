class VideoBlock < BaseBlock
  belongs_to :media_item

  def self.permitted_params
    [:media_item_id, :autoplay]
  end

  def self.display_name
    'Video Block'
  end

  def self.display_icon
    'glyphicon glyphicon-play'
  end
end
