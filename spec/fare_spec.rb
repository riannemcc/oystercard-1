require 'fare'

describe Fare do

  let(:journeys){ double :journeys }
  let(:station_zone_1){ double :station_zone_1, :zone => 1 }
  let(:station_zone_2){ double :station_zone_2, :zone => 2 }
  let(:station_zone_3){ double :station_zone_3, :zone => 3 }
  let(:station_zone_4){ double :station_zone_4, :zone => 4 }

  it 'calculates the fare for a journey that doesnt cross a zone boundary' do
    expect(subject.get_fare(station_zone_1, station_zone_1)). to eq 1
  end

  it 'calculates the fare for a journey that crosses one zone' do
    expect(subject.get_fare(station_zone_1, station_zone_2)). to eq 2
  end

  it 'calculates the fare for a journey that crosses two zones' do
    expect(subject.get_fare(station_zone_1, station_zone_3)). to eq 3
  end

  it 'calculates the fare for a journey that crosses two zones from higher to lower' do
    expect(subject.get_fare(station_zone_4, station_zone_2)). to eq 3
  end

  it 'returns penalty fare when no exit_station' do
    expect(subject.get_fare(station_zone_1, nil)).to eq Fare::PENALTY_FARE
  end
end
