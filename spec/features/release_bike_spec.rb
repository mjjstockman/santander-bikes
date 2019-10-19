require 'docking_station'

describe DockingStation do
  subject(:docking_station) { described_class.new }

  it 'releases a bike' do
    expect(docking_station).to respond_to :release_bike
  end

  it 'releases a bike' do
    expect(docking_station.release_bike).to eq Bike
  end
end
