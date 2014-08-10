require 'rails_helper'

describe Transfermarkt::NationalTeamWorker do
  let!(:url) { "http://some-url.com" }
  it { should be_processed_in :teams }

  before(:each) do
    allow(Transfermarkt::NationalTeam).to receive_message_chain(:new, :teams).and_return([{ world_ranking: 1, name: 'Germany', squad_size: 22 }])
  end

  it "creates a new team" do
    expect { subject.perform(url) }.to change(Team::NationalTeam, :count)
  end

  it "enqueues a new job" do
    subject.perform(url)
    expect(Transfermarkt::NationalTeamWorker).to have_enqueued_job("#{url}?page=2")
  end
end
