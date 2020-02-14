class Post < Forest::ApplicationRecord
  include Blockable
  include Sluggable
  include Statusable

  belongs_to :user
  belongs_to :media_item

  scope :by_user, -> (user) { where(user: user) }
  scope :by_username, -> { joins(:user).order('users.last_name ASC, users.first_name ASC, users.email ASC') }

  validates_presence_of :title

  def self.resource_description
    'Each post represents a page of your project.'
  end

  def first_sentence
    blocks.find { |b| b.try(:text).present? }.try(:text).to_s.truncate_words(40)
  end
end
