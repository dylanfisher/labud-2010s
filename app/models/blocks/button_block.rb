class ButtonBlock < BaseBlock
  validates_presence_of [:link_url, :link_label]
  validate :has_valid_url?

  def self.permitted_params
    [:link_url, :link_label]
  end

  def self.display_name
    'Button Block'
  end

  # def self.display_icon
  #   'glyphicon glyphicon-align-left'
  # end

  private

  def has_valid_url?
    unless link_url.blank?
      errors.add(:link_url, 'must be a valid URL (include http, www, etc.)') unless ApplicationController.helpers.valid_url?(link_url)
    end
  end
end
