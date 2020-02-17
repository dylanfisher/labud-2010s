class Post < Forest::ApplicationRecord
  include Blockable
  include Sluggable
  include Statusable

  belongs_to :user
  belongs_to :media_item

  # has_many :post_relations, class_name: 'RelatedPost'
  # has_many :related_posts, through: :post_relations

  has_many :related_posts, -> { order(:position) }, dependent: :destroy, inverse_of: :post
  accepts_nested_attributes_for :related_posts, reject_if: :all_blank, allow_destroy: true

  scope :by_user, -> (user) { where(user: user) }
  scope :by_username, -> { joins(:user).order('users.last_name ASC, users.first_name ASC, users.email ASC') }

  validates_presence_of :title

  def self.resource_description
    'Each post represents a page of your project.'
  end

  def first_sentence
    blocks.find { |b| b.try(:text).present? }.try(:text).to_s.truncate_words(40)
  end

  def to_select2_response
    if respond_to?(:media_item) && media_item.try(:attachment).present?
      img_tag = "<img src='#{media_item.attachment.url(:thumb)}' style='height: 20px; display: inline-block; vertical-align: top;'> "
    end
    "#{img_tag}<span class='select2-response__id'>#{id}</span> #{to_label} <span class='select2-response__id'>#{user.name}</span>"
  end
end
