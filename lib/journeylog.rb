class JourneyLog

  attr_reader :journey_class, :journeys

  def initialize(journey_class: Journey)
    @journey_class = journey_class
    @journeys = []
  end

  def start(station)
    @journey = journey_class.new(entry_station: nil)
    @journeys << @journey
  end

  def finish(station)
    @journey.end_journey(exit_station)
  end


  private
  attr_reader :journey_class

  def current_journey
    @current_journey ||= journey_class.new
  end
end
