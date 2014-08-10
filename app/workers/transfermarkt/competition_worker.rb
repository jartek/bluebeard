class Transfermarkt::CompetitionWorker
  include Sidekiq::Worker
  sidekiq_options queue: :competitions
  def perform(competition_url)
    teams = Transfermarkt::Competition.new(competition_url).teams
    teams.each do |team|
      Transfermarkt::TeamWorker.perform_in(30.seconds.from_now, team)
    end
  end
end
