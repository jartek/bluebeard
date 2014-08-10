module Helpers
  def is_valid_url?(url)
    return false unless url.match(URI::regexp)
    true
  end

  def transfermarkt_file(file_name)
    File.open(File.dirname(__FILE__) + "/assets/transfermarkt/#{file_name}.html")
  end
end
