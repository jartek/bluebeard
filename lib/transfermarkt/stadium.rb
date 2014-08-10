class Transfermarkt::Stadium < Transfermarkt::Base

  def attributes
    {
      name: name,
      year_built: year_built,
      capacity: capacity,
      corporate_boxes: corporate_boxes || 0,
      turf_heating: turf_heating?,
      running_track: running_track?,
      height: size[:height],
      width: size[:width],
      surface: surface || "Natural Turf",
      address: address
    }
  end

  def name
    data.css('.content .profilheader tr').select { |row| row.text.include?('Name of stadium') }[0].css('td').text.strip.gsub("\u00A0", "")
  end

  def capacity
    data.css('.content .profilheader tr').select { |row| row.text.include?('Total capacity') }[0].css('td').text.strip.gsub("\u00A0", "").gsub(".", "").to_i
  end

  def corporate_boxes
    location = data.css('.content .profilheader tr').select { |row| row.text.include?('boxes') }
    return if location.blank?
    location[0].css('td').text.strip.gsub("\u00A0", "").gsub(".", "").to_i
  end

  def year_built
    data.css('.content .profilheader tr').select { |row| row.text.include?('Year of construction') }[0].css('td').text.strip.gsub("\u00A0", "").to_i
  end

  def turf_heating?
    location = data.css('.content .profilheader tr').select { |row| row.text.include?('Turf heating') }
    return false if location.blank?
    location[0].css('td').text.strip.gsub("\u00A0", "") == 'yes'
  end

  def running_track?
    data.css('.content .profilheader tr').select { |row| row.text.include?('Running track') }[0].css('td').text.strip.gsub("\u00A0", "") == 'yes'
  end

  def surface
    location = data.css('.content .profilheader tr').select { |row| row.text.include?('Surface') }
    return if location.blank?
    location[0].css('td').text.strip.gsub("\u00A0", "")
  end

  def size
    location = data.css('.content .profilheader tr').select { |row| row.text.include?('Size of playing field') }
    return { width: 0, height: 0 } if location.blank?
    size = location[0].css('td').text.strip.gsub("\u00A0", "")
    {
      width: size.split("x").first.strip.chomp.to_i,
      height: size.split("x").last.strip.chomp.to_i
    }
  end

  def address
    address_container = data.css('.box .header').select { |box| box.text.include?('Contact') }[0].parent.css('.profilheader tr')
    address_container[1..address_container.length-2].collect{ |a| a.text.strip }
  end
end
