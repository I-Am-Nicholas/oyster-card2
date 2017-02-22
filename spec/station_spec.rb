require 'station'

describe Station do
  subject {described_class.new(name: 'whitechapel', zone: 1)}

  it "exposes a name" do
    expect(subject.name).to eq('whitechapel')
  end

  it "exposes a zone" do
    expect(subject.zone).to eq(1)
  end
end
