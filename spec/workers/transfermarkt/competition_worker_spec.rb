require 'rails_helper'

RSpec.describe Transfermarkt::CompetitionWorker do
  let!(:url) { "http://some-url.com" }
  it { should be_processed_in :competitions }

  it "enqueues jobs for teams in each competition" do
    allow(Transfermarkt::Competition).to receive_message_chain(:new, :teams).and_return(["Chelsea", "Liverpool"])
    subject.perform(url)
    expect(Transfermarkt::TeamWorker).to have(2).jobs
  end
end
