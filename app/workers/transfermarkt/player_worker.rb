class Transfermarkt::PlayerWorker
  include Sidekiq::Worker
  sidekiq_options queue: :players

  def perform(url)
    player = Transfermarkt::Player.new(url)
    Player.create!(player.attributes)
  end
end
