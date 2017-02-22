class Journey
  attr_accessor :entry_station, :exit_station

  def initialize
    @journeys = []
  end

  MIN_FARE = 1
  PENALTY_FARE = 6

  def start_journey(entry_station)
    @journeys << {entry_station: entry_station, exit_station: exit_station} if @entry_station != nil
    @entry_station = entry_station
  end

  def finish_journey(exit_station)
    @exit_station = exit_station
    @journeys << {entry_station: entry_station, exit_station: exit_station}
    @exit_station, @entry_station = nil, nil
  end

  def calculate_fare
    complete? ? MIN_FARE : PENALTY_FARE
  end

  def complete?
    !(@journeys.last.values.include?(nil))
  end
end
