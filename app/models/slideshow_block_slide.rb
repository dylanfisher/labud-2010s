class SlideshowBlockSlide < ApplicationRecord
  belongs_to :slideshow_block, optional: true
  belongs_to :media_item, optional: true
end
