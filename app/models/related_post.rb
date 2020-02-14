class RelatedPost < ApplicationRecord
  belongs_to :post
  belongs_to :related_post, class_name: 'Post'

  validates_presence_of :text
end
