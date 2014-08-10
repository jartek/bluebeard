class Transfermarkt::NationalTeam < Transfermarkt::Base
  def teams
    result = []
    raw_data.each do |team|
      result << team_attributes(team)
    end
    result
  end

  private

  def raw_data
    result = []
    data.css('.items tbody tr').each do |row|
      obj, i = {}, 0
      row.css('td').each do |col|
        next if i == 3
        if i == 0
          obj[:ranking] = col.text.strip.to_i
        elsif i == 1
          obj[:name] = col.text.strip
        else
          obj[:squad_size] = col.text.strip.to_i
        end
        i = i + 1
      end
      result << obj
    end
    result
  end

  def team_attributes(team)
    {
      name: team[:name],
      world_ranking: team[:ranking],
      squad_size: team[:squad_size]
    }
  end
end
