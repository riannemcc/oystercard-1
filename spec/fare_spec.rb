require 'fare'

describe Fare do

  let(:journeys){ double :journeys }

  it 'calculates the fare for a journey that doesnt cross a zone boundary' do
    journeys.last
    expect(subject.charge). to eq 1
  end


end
