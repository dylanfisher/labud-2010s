class ImageBlock < BaseBlock
  belongs_to :media_item

  def self.permitted_params
    [:media_item_id, :column_size]
  end

  def self.display_name
    'Image Block'
  end

  def self.display_icon
    'glyphicon glyphicon-picture'
  end
end
