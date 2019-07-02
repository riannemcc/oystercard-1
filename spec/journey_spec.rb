require 'journey'
require 'oystercard'
require 'station'

describe Journey do

    subject(:station) {Station.new(:name, 1)}
    subject(:journey) {Journey.new(station, :exit_station)}
    
    it 'creates a new journey' do
        expect(subject).to be_instance_of(Journey)
    end

    it 'starts a new journey' do
        card = Oystercard.new(10)
        card.touch_in(station)
        expect(subject.start_journey(journey.entry_station)).to eq station
    end

end
