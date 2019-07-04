class JourneyLog

  attr_reader :journey_class

  def initialize(journey_class: Journey)
    @journey_class = journey_class
    @journeys = []
    @current_journey = nil
  end

  def start(station)
    @current_journey = journey_class.new(entry_station: station)
    @journeys << @current_journey
  end

  def finish(station)
    current_journey.end_journey(station)
    @current_journey = nil
  end

  def journeys
    @journeys.dup
  end

  private

  def current_journey
    return @current_journey if @current_journey
    @current_journey = journey_class.new
    @journeys << @current_journey
    @current_journey
  end
end
