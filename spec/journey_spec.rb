require 'journey'

describe Journey do

  it {is_expected.to respond_to :start_journey}
  it {is_expected.to respond_to :finish_journey}
  it {is_expected.to respond_to :calculate_fare}
  it {is_expected.to respond_to :complete?}
end
