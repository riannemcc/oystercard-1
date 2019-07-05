class Fare

  MIN_CHARGE = 1
  PENALTY_FARE = 6

  def get_fare(entry_station, exit_station)
    if exit_station == nil
      PENALTY_FARE
    else
      zone_diff = (entry_station.zone - exit_station.zone).abs
      zone_diff + MIN_CHARGE
    end
  end

end
