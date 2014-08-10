require 'rails_helper'

RSpec.describe Transfermarkt::TeamWorker do
  let!(:url) { "http://some-url.com" }
  it { should be_processed_in :teams }

  let!(:team) do
    lfc = transfermarkt_file('liverpool')
    stub_request(:get, url).to_return(status: 200, body: lfc, headers: {})
    Transfermarkt::Team.new(url)
  end

  it "creates a team" do
    expect{
      subject.perform(url)
    }.to change(Team::ClubTeam, :count)
  end

  it "enqueues jobs for players in each team" do
    subject.perform(url)
    expect(Transfermarkt::PlayerWorker).to have(22).jobs
  end

  it "enqueues jobs for the team's stadium" do
    subject.perform(url)
    expect(Transfermarkt::StadiumWorker).to have(1).jobs
  end
end
