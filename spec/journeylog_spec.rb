require 'journey'
require 'oystercard'
require 'station'
require 'journeylog'

describe JourneyLog do

let(:journey){ double :journey, station: nil, is_complete: false }
let(:station){ double :station }
let(:zone){ double :zone }
let(:journey_class){ double :journey_class, new: journey}
subject {described_class.new(journey_class: journey_class)}

  describe '#start' do
    it 'starts a new journey' do
      expect(journey_class).to receive(:new).with(station)
      subject.start(station)
    end

    it 'records a journey' do
      allow(journey_class).to receive(:new).and_return journey
      subject.start(station)
      expect(subject.journeys).to include journey
    end

    it 'finishes a journey' do
      allow(journey_class).to receive(:new).and_return journey
      subject.start(station)
      expect(journey).to receive(:end_journey).with(station)
      subject.finish(station)
      # expect(journey_class.end).to change{ journey_class.current_journey == nil }
    end
  end
end
