require 'station'

describe Station do

    subject(:station) {Station.new(:name, 1)}
    
    it 'creates a new station' do
        expect(subject).to be_instance_of(Station)
    end
end
