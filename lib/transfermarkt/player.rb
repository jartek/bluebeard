class Transfermarkt::Player < Transfermarkt::Base
  def attributes
    s_n_t = ::Team::NationalTeam.where(name: secondary_nationality, national_team: true).first
    snt = s_n_t.blank? ? 0 : s_n_t.id
    {
      full_name: full_name,
      club_team_id: ::Team::ClubTeam.where(name: current_club).first.id,
      squad_number: squad_number,
      date_of_birth: date_of_birth,
      birthplace: birthplace || "Unknown",
      height: height || 0,
      foot: ::Player::FOOT[foot] || ::Player::FOOT['right'],
      national_team_id: ::Team::NationalTeam.where(name: main_nationality, national_team: true).first.id,
      secondary_national_team_id: snt,
      main_position: main_position,
      secondary_position: secondary_positions
    }
  end

  def full_name
    data.css('.spielername-profil').text.strip.gsub("\u00A0", "")
  end

  def squad_number
    data.css('.rueckennummer-profil').text.strip.gsub("#", "")
  end

  def date_of_birth
    Date.parse(data.css('.auflistung:first tr').select { |row| row.text.include?('Date of birth') }[0].css('td').text.strip.gsub("\u00A0", ""))
  end

  def birthplace
    location = data.css('.auflistung:first tr').select { |row| row.text.include?('Place of birth') }
    return if location.blank?
    location[0].css('td').text.strip.gsub("\u00A0", "")
  end

  def height
    location = data.css('.auflistung:first tr').select { |row| row.text.include?('Height') }
    return if location.blank?
    location[0].css('td').text.strip.gsub("\u00A0", "").gsub(",", "").to_i
  end

  def foot
    location = data.css('.auflistung:first tr').select { |row| row.text.include?('Foot') }
    return if location.blank?
    location[0].css('td').text.strip.gsub("\u00A0", "")
  end

  def main_nationality
    location = data.css('.profilheader tr').select { |row| row.text.include?('National player') }
    if location.blank?
      location = data.css('.profilheader tr').select { |row| row.text.include?('Nationality') }[0].css('img')[0]['title'].gsub("\u00A0", "").gsub(/U\d+/, '').strip
    else
      location[0].css('a')[0].text.gsub("\u00A0", "").gsub(/U\d+/, '').strip
    end
  end

  def secondary_nationality
    data.css('.auflistung:first tr').select { |row| row.text.include?('Nationality') }[0].css('td img:last')[0]['title'].strip.gsub("\u00A0", "")
  end

  def current_club
    data.css('.profilheader tr').select { |row| row.text.include?('Current club') }[0].css('td').text.strip.gsub("\u00A0", "")
  end

  def main_position
    data.css('.auflistung:nth-child(1) tr').select { |row| row.text.include?('Main position') }[0].css('td').text.split(":").last.strip.gsub("\u00A0", "")
  end

  def secondary_positions
    location = data.css('.auflistung:nth-child(1) tr').select { |row| row.text.include?('Secondary positions') }
    return if location.blank?
    location[0].css('td a').collect { |a| a.text.strip.gsub("\u00A0", "") }
  end

  def transfer_history
    result = []
    table = data.css('.responsive-table')[0].css('tbody tr')
    i=true
    table.each do |row|
      row_hash = {}
      row_hash['date'] = Date.parse(row.css('td:nth-child(2)').text.strip.gsub("\u00A0", ""))
      row_hash['from'] = row.css('td:nth-child(3) a')[0]['title']
      row_hash['to'] = row.css('td:nth-child(6) a')[0]['title']
      row_hash['cost'] = cost(row.css('td:nth-child(11)').text.strip.chomp)
      result << row_hash
    end
    result
  end

  private

  def cost(val)
    if val.include?('Mill.')
      val.split('Mill').first.gsub(',', '').to_i * 10_000
    elsif val.include?('Th.')
      val.split('Th').first.gsub(',', '').to_i * 100
    elsif val.include?('loan')
      -1
    else
      0
    end
  end
end
