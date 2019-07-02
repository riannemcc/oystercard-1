require 'journey'

describe Journey do
    subject(:journey) {Journey.new(:entry_station, :exit_station)}
    
    it 'creates a new journey' do
        expect(subject).to be_instance_of(Journey)
    end

end
