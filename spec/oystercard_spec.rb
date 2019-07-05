require 'oystercard'
require 'journey'
require 'station'

describe Oystercard do

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
      zone = 1
      expect { subject.touch_in(station) }.to raise_error "Insufficient funds"
    end

  end

  describe '#touch_out' do

    it 'deducts money from card on touch out' do
      subject = Oystercard.new(10)
      station = Station.new('Aldgate', 1)
      subject.touch_in(station)
      expect{ subject.touch_out(station) }.to change{ subject.balance }.by -1
    end

  end

  describe '#minimum_balance?' do

    it 'it checks funds not under minimum_balance' do
      subject = Oystercard.new(1)
      expect(subject.insufficient_balance?).to eq false
    end

  end

end
