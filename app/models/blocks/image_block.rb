class ImageBlock < BaseBlock
  enum column_size: {
    full_bleed: 0,
    col_12: 1,
    col_6: 2
  }

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

  def col_class
    case column_size
    when 'col_6'
      'col-md-6'
    else
      'col-md-12'
    end
  end
end
