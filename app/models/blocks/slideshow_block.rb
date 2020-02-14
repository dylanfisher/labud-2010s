class SlideshowBlock < BaseBlock
  has_many_ordered :media_items, through: :slideshow_block_slides

  def self.permitted_params
    [media_item_ids: []]
  end

  def self.display_name
    'Slideshow Block'
  end

  # def self.display_icon
  #   'glyphicon glyphicon-align-left'
  # end
end
