class Transfermarkt::TeamWorker
  include Sidekiq::Worker
  sidekiq_options queue: :teams

  def perform(url)
    team = Transfermarkt::Team.new(url)
    team.players.each do |player|
      Transfermarkt::PlayerWorker.perform_in(3.minutes.from_now, player)
    end
    Transfermarkt::StadiumWorker.perform_in(5.minutes.from_now, team.stadium)
    if team.national_team?
      Team::NationalTeam.create!(team.attributes)
    else
      Team::ClubTeam.create!(team.attributes)
    end
  end
end
