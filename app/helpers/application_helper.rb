module ApplicationHelper
  def valid_url?(string, options = {})
    return false if string.blank?
    return true if string.first == '/'

    uri = URI.parse(string)

    if options.fetch(:relative, false)
      return true if uri.relative?
    end

    uri.is_a?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
    false
  end
end
