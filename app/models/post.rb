class Post < Forest::ApplicationRecord
  include Blockable
  include Sluggable
  include Statusable

  belongs_to :user
  belongs_to :media_item

  scope :by_user, -> (user) { where(user: user) }

  validates_presence_of :title

  def self.resource_description
    'Each post represents a page of your project.'
  end
end
