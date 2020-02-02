class ImageGridBlock < BaseBlock
  has_many_ordered :media_items, through: :image_grid_block_items

  validates_presence_of :column_size
  validate :has_valid_column_size

  def self.permitted_params
    [:column_size, :caption, media_item_ids: []]
  end

  def self.display_name
    'Image Grid Block'
  end

  def self.display_icon
    'glyphicon glyphicon-picture'
  end

  private

  def has_valid_column_size
    if column_size < 1 || column_size > 6
      errors.add :column_size, 'invalid size'
    end
  end
end
