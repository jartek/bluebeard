require 'open-uri'

class Transfermarkt::Base
  BASE_DOMAIN = 'http://transfermarkt.com'

  attr_reader :data

  def initialize(url)
    @data = Nokogiri::HTML(open(url).read)
  end
end
