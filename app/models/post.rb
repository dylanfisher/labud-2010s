class Post < Forest::ApplicationRecord
  include Blockable
  include Sluggable
  include Statusable

  belongs_to :user

  scope :by_user, -> (user) { where(user: user) }

  def self.resource_description
    'Each post represents a page of your project.'
  end
end
