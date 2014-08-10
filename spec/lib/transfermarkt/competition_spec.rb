require 'rails_helper'

describe Transfermarkt::Competition do
  let(:competition_url) { URI('http://some-url.com') }

  let(:response) do
    epl = transfermarkt_file('epl')
    stub_request(:get, competition_url).to_return(status: 200, body: epl, headers: {})
    Transfermarkt::Competition.new(competition_url)
  end

  describe "#teams" do
    it "should have exactly 20 items" do
      expect(response.teams.size).to eq(20)
    end

    it "should have valid urls" do
      valid = response.teams.all? { |url| is_valid_url?(url) }
      expect(valid).to eq(true)
    end
  end
end
