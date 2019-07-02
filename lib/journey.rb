class Journey

    attr_reader  :entry_station, :exit_station, :journeys

    def initialize(entry_station, exit_station)
        @entry_station = entry_station
        @exit_station = exit_station
        @journeys = []
    end

    def start_journey(entry_station)
        @entry_station = entry_station
    end

end