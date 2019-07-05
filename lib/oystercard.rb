# require 'journey'
require 'journeylog'

class Oystercard

  MAX_BALANCE = 90

  attr_reader :balance, :journeys, :exit_station

  def initialize(balance=0)
    @balance = balance
    @journey_log = JourneyLog.new

  end

  def top_up(amount)
    raise "Maximum balance of #{MAX_BALANCE} exceeded" if balance_exceeded?(amount)
    @balance += amount
  end

  def touch_in(station)
    raise "Insufficient funds" if insufficient_balance?
    @journey_log.start(station)
  end

  def touch_out(station)
    @journey_log.finish(station)
    deduct(@journey_log.last_journey_fare)
  end

  def insufficient_balance?
    @balance < Fare::MIN_CHARGE
  end

  private

  def balance_exceeded?(amount)
    (@balance + amount) > MAX_BALANCE
  end

  def deduct(amount)
    @balance -= amount
  end

end
