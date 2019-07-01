require 'oystercard'

describe Oystercard do

  # In order to use public transport
  # As a customer
  # I want money on my card

  describe '#balance' do
    it 'card contains money' do
      balance = 100
      subject = Oystercard.new(balance)
      expect(subject.balance).to eq balance
    end
  end

  # In order to keep using public transport
  # As a customer
  # I want to add money to my card

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
      subject.touch_out(0)
      expect(subject.in_journey?).to eq false
    end
    it 'deducts money from card on touch out' do
      subject = Oystercard.new(10)
      expect{ subject.touch_out }.to change{ subject.balance }.by -1
    end
    it 'deletes entry_station' do
      subject = Oystercard.new(5)
      station = 'Algate East'
      subject.touch_in(station)
      subject.touch_out
      expect(subject.entry_station).to eq nil
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

# In order to protect my money
# As a customer
# I don't want to put too much money on my card

# In order to pay for my journey
# As a customer
# I need my fare deducted from my card

# In order to get through the barriers
# As a customer
# I need to touch in and out

# In order to pay for my journey
# As a customer
# I need to have the minimum amount for a single journey

# In order to pay for my journey
# As a customer
# I need to pay for my journey when it's complete

# In order to pay for my journey
# As a customer
# I need to know where I've travelled from

# In order to know where I have been
# As a customer
# I want to see to all my previous trips

# In order to know how far I have travelled
# As a customer
# I want to know what zone a station is in

# In order to be charged correctly
# As a customer
# I need a penalty charge deducted if I fail to touch in or out

# In order to be charged the correct amount
# As a customer
# I need to have the correct fare calculated
