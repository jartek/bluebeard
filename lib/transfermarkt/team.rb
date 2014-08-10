class Transfermarkt::Team < Transfermarkt::Base

  def attributes
    {
      name: name,
      squad_size: squad_size
    }
  end

  def name
    data.css('.spielername-profil').text.strip
  end

  def national_team?
    data.css('.profilheader tr').any? { |row| row.text.include?('Placement FIFA world ranking') }
  end

  def squad_size
    data.css('.profilheader tr').select { |row| row.text.include?('Squad size') }[0].css('td').text.strip.gsub("\u00A0", "").to_i
  end

  def players
    player_array = data.css('.items').first.css('tr.odd, tr.even').css('.inline-table tr:first-child td:last-child a')
    player_array.inject([]) do |collection, player|
      collection << BASE_DOMAIN + player['href']
    end
  end

  def manager
    staff_container = data.css('.header_slider').select { |row| row.css('p.text').text.strip == 'Staff' }[0].parent
    manager = staff_container.css('li.slider-list').select { |row| row.css('.container-zusatzinfo b:first-child').text.strip == 'Manager' }[0]
    BASE_DOMAIN + manager.css('.container-hauptinfo a')[0]['href']
  end

  def stadium
    return if national_team?
    BASE_DOMAIN + data.css('.profilheader a[href*=stadion]')[0]['href']
  end

  def fixtures
    BASE_DOMAIN + data.css('.footer a[href*=spielplan]')[0]['href']
  end
end
