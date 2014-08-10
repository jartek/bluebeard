require 'rails_helper'

RSpec.describe Transfermarkt::StadiumWorker do

  let!(:url) { "http://some-url.com" }
  it { should be_processed_in :stadia }

  before(:each) do
    anfield = transfermarkt_file('anfield')
    stub_request(:get, url).to_return(status: 200, body: anfield, headers: {})
    Transfermarkt::Stadium.new(url)
  end

  it "creates a stadium" do
    expect { subject.perform(url) }.to change(Stadium, :count)
  end

end
