class EmbedBlock < BaseBlock
  def self.permitted_params
    [:embed_code, :full_bleed]
  end

  def self.display_name
    'Embed Block'
  end

  # def self.display_icon
  #   'glyphicon glyphicon-align-left'
  # end
end
