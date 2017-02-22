require 'oystercard'

describe 'Feature Tests' do

  #  In order to use public transport
  #  As a customer
  #  I want money on my card
  it "puts money on card" do
    card = Oystercard.new
    card.top_up(20)
    expect(card.balance).to eq 20
  end

#EDGE CASE

  it "raises an error if money is not a number" do
    card = Oystercard.new
    expect{card.top_up('Whitechapel')}.to raise_error "Please top-up with money."
  end

  #  In order to pay for my journey
  #  As a customer
  #  I need to know where I've travelled from

  it "records the touched-in station" do

    station = ('whitechapel')
    card = Oystercard.new
    card.top_up(5)
    card.touch_in(station)
    expect(card.entry_station).to eq(station)
  end

  it "resets the entry station to nil" do
      card = Oystercard.new
      card.top_up(5)
      card.touch_in('whitechapel')
      card.touch_out('old gate')
      expect(card.entry_station).to eq nil
  end




end
