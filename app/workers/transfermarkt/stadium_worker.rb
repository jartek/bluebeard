class Transfermarkt::StadiumWorker
  include Sidekiq::Worker
  sidekiq_options queue: :stadia

  def perform(url)
    stadium = Transfermarkt::Stadium.new(url)
    Stadium.create!(stadium.attributes)
  end
end
