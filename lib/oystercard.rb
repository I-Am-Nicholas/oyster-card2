class Oystercard
attr_reader :balance, :entry_station

  def initialize
    @balance = 0
    @in_transit = []
  end

  def top_up(money)
    fail "Please top-up with money." unless money.is_a?(Fixnum)
    fail "The maximum amount is: £#{LIMIT}." if money > LIMIT
    @balance += money
  end

  def check_balance
    fail "The minimum balance needed for your journey is £#{MIN}" unless @balance > MIN
  end

  def touch_in(card, station)
    check_balance
    @entry_station = station
    @in_transit << card
  end

  def touch_out
    deduct(MIN_FARE)
    @in_transit.pop
    @entry_station = nil
  end

  def in_journey?
    true unless @entry_station = nil
  end

  private

  LIMIT = 90
  MIN = 1
  MIN_FARE = 3

  def deduct(fare)
    @balance -= fare
  end

end
