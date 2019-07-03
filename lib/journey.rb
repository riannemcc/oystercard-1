class Journey
   PENALTY_FARE = 6

    attr_reader  :entry_station, :exit_station, :is_complete

    def initialize(entry_station)
        @entry_station = entry_station
        @is_complete = false
    end

    def end_journey(exit_station)
      @exit_station = exit_station
      @is_complete = true
    end

    def calculate_fare
      if @exit_station
        Oystercard::MIN_CHARGE
      else
        PENALTY_FARE
      end
    end

end
