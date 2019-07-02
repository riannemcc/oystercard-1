require 'oystercard'
require 'journey'
require 'station'

describe Oystercard do

  it 'checks that the card has an empty list of journeys by default' do
    expect(subject.journeys).to eq []
  end

  describe '#balance' do

    it 'card contains money' do
      balance = 100
      subject = Oystercard.new(balance)
      expect(subject.balance).to eq balance
    end

  end

  describe "#top_up" do

    it 'adds money to balance' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end

    it 'raises error when maximum limit is exceeded' do
      maximum_balance = Oystercard::MAX_BALANCE
      subject.top_up(maximum_balance)
      expect { subject.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
    end

  end

  describe '#touch_in' do

    it 'raises error when funds under minimum_balance' do
      subject = Oystercard.new(0)
      station = 'Algate East'
      expect { subject.touch_in(station) }.to raise_error "Insufficient funds"
    end

    it 'changes card status to "in journey"' do
      subject = Oystercard.new(5)
      station = 'Algate East'
      subject.touch_in(station)
      expect(subject.in_journey?).to eq true
    end

    it 'accepts new entry_station' do
      subject = Oystercard.new(5)
      station = 'Algate East'
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end

  end

  describe '#touch_out' do

    it 'changes card status to "not in journey' do
      station = 'Aldgate East'
      subject.touch_out(station)
      expect(subject.in_journey?).to eq false
    end

    it 'deducts money from card on touch out' do
      subject = Oystercard.new(10)
      station = 'Aldgate East'
      expect{ subject.touch_out(station) }.to change{ subject.balance }.by -1
    end

    it 'deletes entry_station' do
      subject = Oystercard.new(5)
      station = 'Aldgate East'
      subject.touch_in(station)
      expect { subject.touch_out(station) }.to change{ subject.entry_station }.to nil
    end

    it 'stores one journey' do
      subject = Oystercard.new(10)
      station = 'Aldgate East'
      subject.touch_in(station)
      expect(subject.touch_out(station)).to eq [{entry_station: station, exit_station: station}]
    end
  
  end

  describe '#in_journey?' do

    it 'initially card is not "in journey"' do
      expect(subject.in_journey?).to eq false
    end

  end

  describe '#minimum_balance?' do

    it 'it checks funds not under minimum_balance' do
      subject = Oystercard.new(1)
      expect(subject.insufficient_balance?).to eq false
    end

  end

end
