class Oystercard

MAX_BALANCE = 90
MIN_CHARGE = 1

  attr_reader :balance, :entry_station, :journeys, :exit_station

  def initialize(balance=0)
    @balance = balance
    @journeys = []
  end

  def top_up(amount)
    raise "Maximum balance of #{MAX_BALANCE} exceeded" if balance_exceeded?(amount)
    @balance += amount
  end

  def touch_in(station)
    raise "Insufficient funds" if insufficient_balance?
    @entry_station = station
  end

  def touch_out(station)
    deduct(1)
    @entry_station = nil
    @exit_station = station
    @journeys << {entry_station: station, exit_station: station}
  end

  def in_journey?
    @entry_station != nil
  end

  def insufficient_balance?
    @balance < MIN_CHARGE
  end

  private

  def balance_exceeded?(amount)
    (@balance + amount) > MAX_BALANCE
  end

  def deduct(amount)
    @balance -= amount
  end

end
