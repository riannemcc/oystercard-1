class Station

    attr_reader :zone

    def initialize(name, zone)
        @name = name
        @zone = zone
    end

end

# Get rid of zone being used as a parameter in other
# classes as it will be available via `station.zone`
# as above
