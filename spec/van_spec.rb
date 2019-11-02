require 'van'
require 'bike'
require 'docking_station'

describe 'Van' do
  let(:bike) { double('bike') }
  let(:broken_bike) { double('broken_bike') }
  let(:docking_station) { double('docking_station') }

  it 'collects broken bikes' do
    allow(bike).to receive(:working?).and_return(true)
    allow(broken_bike).to receive(:working?).and_return(false)
    allow(broken_bike).to receive(:report_broken)
    allow(docking_station).to receive(:dock).with(broken_bike)
    allow(docking_station).to receive(:broken_bikes).and_return(broken_bike)

    van = Van.new
    broken_bike.report_broken
    docking_station.dock(broken_bike)
    expect(van.collect_broken_bikes(docking_station)).to eq broken_bike
  end
end
