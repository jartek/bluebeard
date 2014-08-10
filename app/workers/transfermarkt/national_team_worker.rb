class Transfermarkt::NationalTeamWorker
  include Sidekiq::Worker
  sidekiq_options queue: :teams
  def perform(url)
    teams = Transfermarkt::NationalTeam.new(url).teams
    teams.each do |team|
      Team::NationalTeam.create!(team)
    end
    if url.include? "page"
      page_no = url.last.to_i + 1
      return if page_no > 8
      url = url.chop + page_no.to_s
    else
      url = url + "?page=2"
    end
    Transfermarkt::NationalTeamWorker.perform_in(30.seconds.from_now, url)
  end
end
