class Transfermarkt::Competition < Transfermarkt::Base

  def teams
    team_array = data.css('.items').first.css('tr.odd, tr.even').css('tr td:first-child a')
    team_array.inject([]) do |collection, team|
      collection << BASE_DOMAIN + team['href']
    end
  end

end
