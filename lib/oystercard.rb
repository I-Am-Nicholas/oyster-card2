class Oystercard
attr_accessor :balance, :entry_station, :exit_station

  def initialize(journey = Journey.new)
    @balance = 0
    @journeys = []
    @journey = journey
  end

  def top_up(money)
    fail "Please top-up with money." unless money.is_a?(Fixnum)
    fail "The maximum amount is: £#{MAX_LIMIT}." if (balance + money) > MAX_LIMIT
    @balance += money
  end

  def touch_in(entry_station)
    check_balance
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MIN_FARE)
    @exit_station = exit_station
    @journeys << {entry_station: entry_station, exit_station: exit_station}
    @entry_station = nil
    @exit_station = nil
  end

  def in_journey?
    !!@entry_station
  end

  private

  MAX_LIMIT = 90
  MIN_LIMIT = 1
  MIN_FARE = 3

  def check_balance
    fail "The minimum balance needed for your journey is £#{MIN_LIMIT}" unless @balance > MIN_LIMIT
  end

  def deduct(fare)
    @balance -= fare
  end

end
