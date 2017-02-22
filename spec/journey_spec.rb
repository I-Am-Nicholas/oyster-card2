require 'journey'

describe Journey do
  subject(:journey) {described_class.new}

  it {is_expected.to respond_to :finish_journey}
  it {is_expected.to respond_to :calculate_fare}
  it {is_expected.to respond_to :complete?}

  it "responds to Journey with 1 argument" do
    expect(journey).to respond_to(:start_journey).with(1).argument
  end

  it "accepts an entry_station" do
    journey.start_journey('whitechapel')
    expect(journey.entry_station).to eq('whitechapel')
  end

  it "responds to Journey with 1 argument" do
    expect(journey).to respond_to(:finish_journey).with(1).argument
  end

  it "accepts an exit station" do
    journey.finish_journey('aldgate')
    expect(journey.exit_station).to be nil
  end

  it "returns true for complete journeys" do
    journey.start_journey('whitechapel')
    journey.finish_journey('aldgate')
    expect(journey.complete?).to eq true
    expect(journey.calculate_fare).to eq Journey::MIN_FARE
  end

  it "returns false for incomplete journeys with only touch out" do
    journey.finish_journey('aldgate')
    expect(journey.complete?).to eq false
    expect(journey.calculate_fare).to eq Journey::PENALTY_FARE
  end

  it "returns false for incomplete journeys with only touch in" do
    journey.start_journey('aldgate')
    journey.start_journey('aldgate')
    expect(journey.complete?).to eq false
    expect(journey.calculate_fare).to eq Journey::PENALTY_FARE
  end





end
