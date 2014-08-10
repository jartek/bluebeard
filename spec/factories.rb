FactoryGirl.define do

  factory :liverpool, class: Team::ClubTeam do
    name "Liverpool FC"
    squad_size 12
  end

  factory :england, class: Team::NationalTeam do
    name "England"
    squad_size 11
  end

end
