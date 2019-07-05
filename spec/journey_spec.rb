require 'journey'
require 'oystercard'
require 'station'
require 'journeylog'

describe Journey do

    let(:station){ double :station }
    let(:zone){ double :zone }
    subject(:journey) {Journey.new(station)}

    it 'creates a new journey' do
        expect(subject).to be_instance_of(Journey)
    end

    it 'creates a new journey with the given entry_station' do
        expect(journey.entry_station).to eq station
    end

    it 'should not be complete on initialization' do
      expect(journey.is_complete).to be false
    end

    context '#end_journey' do
      it 'sets exit_station' do
        journey.end_journey(station)
        expect(journey.exit_station).to eq station
      end

      it 'set complete to true' do
        journey.end_journey(station)
        expect(journey.is_complete).to be true
      end
    end

    context '#calculate_fare' do
      xit 'returns min charge when exit_station is set' do
        station2 = double(:station2)
        journey.end_journey(station2)
        expect(journey.calculate_fare).to eq Fare::MIN_CHARGE
      end

    end
end
