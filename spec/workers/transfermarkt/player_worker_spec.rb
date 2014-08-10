require 'rails_helper'

RSpec.describe Transfermarkt::PlayerWorker do
  let!(:player_url) { "http://some-url.com" }
  it { should be_processed_in :players }

  before(:each) do
    studge = transfermarkt_file('sturridge')
    stub_request(:get, player_url).to_return(status: 200, body: studge, headers: {})
    Transfermarkt::Player.new(player_url)
  end

  it "creates a player" do
    allow(Team::ClubTeam).to receive_message_chain(:where, :first).and_return(create :liverpool)
    allow(Team::NationalTeam).to receive_message_chain(:where, :first).and_return(create :england)
    expect {
      subject.perform(player_url)
    }.to change(Player, :count)
  end
end
