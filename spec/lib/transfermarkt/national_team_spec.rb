require 'rails_helper'

describe Transfermarkt::NationalTeam do
  let(:national_url) { URI('http://some-url.com') }

  let(:response) do
    teams = transfermarkt_file('national')
    stub_request(:get, national_url).to_return(status: 200, body: teams, headers: {})
    Transfermarkt::NationalTeam.new(national_url)
  end

  describe "#teams" do
    it 'returns an array of teams' do
      expect(response.teams).to include({world_ranking: 24, name:"Algeria", squad_size: 23})
      expect(response.teams).to include({world_ranking: 1, name:"Germany", squad_size: 22})
    end
  end
end
