class Journey

    attr_reader  :entry_station, :exit_station, :is_complete

    def initialize(station, fare_calculator: Fare)
        @entry_station = station
        @is_complete = false
        @fare_calculator = fare_calculator.new
    end

    def end_journey(station)
      @exit_station = station
      @is_complete = true
    end

    def calculate_fare
      @fare_calculator.get_fare(@entry_station, @exit_station)
    end

end
