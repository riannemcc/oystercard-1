class Journey

    attr_reader  :entry_station, :exit_station, :is_complete

    def initialize(station, zone)
        @entry_station = station
        @is_complete = false
    end

    def end_journey(station, zone)
      @exit_station = station
      @is_complete = true
    end

    def calculate_fare
      if @exit_station
        Fare::MIN_CHARGE
      else
        Fare::PENALTY_FARE
      end
    end

end
