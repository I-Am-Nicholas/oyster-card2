require 'oystercard'

describe Oystercard do
  subject(:card) {described_class.new}
  let(:station) {double :station}

  describe "#top_up" do
    it "responds to top_up" do
      expect(card).to respond_to(:top_up)
    end

    it "puts money on card" do
      card.top_up(10)
      expect(card.balance).to eq 10
    end
  end

    it "raises an error if money is not a number" do
      expect{card.top_up(station)}.to raise_error "Please top-up with money."
    end

  describe "#balance" do
    it "has a balance" do
      expect(card.balance).not_to be nil
    end

    it "has a default balance" do
      expect(card.balance).to eq 0
    end

    it "has a maximum limit" do
      expect{card.top_up(91)}.to raise_error "The maximum amount is: £#{Oystercard::LIMIT}."
    end

  end

    describe "touch in/ out" do
      before(:each) do
        card.top_up(3)
      end

      it "adds the card to the in_transit array" do
        expect(card.touch_in(card, station)).to include(card)
      end

      it "returns a boolean value" do
        card.touch_in(card, station)
        expect(subject.in_journey?).to be true
      end

      it "responds to check_balance" do
        expect(card).to respond_to(:check_balance)
      end

      context "When balance is below the minimum" do
        it "returns an error when balance is less than the minimum" do
          card.touch_out
          error = "The minimum balance needed for your journey is £#{Oystercard::MIN}"
          expect{card.touch_in(card, station)}.to raise_error error
        end
      end

      it "reduces the balance by the minimum fare" do
          expect{card.touch_out}.to change{card.balance}.by(-Oystercard::MIN_FARE)
      end

      it "records the touched-in station" do
        card.touch_in(card, station)
        expect(card.entry_station).to eq(station)
      end

      it "resets the entry station to nil" do
        card.touch_in(card, station)
        card.touch_out
        expect(card.entry_station).to eq nil
      end
    end
  end
