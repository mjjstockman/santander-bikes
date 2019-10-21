require 'docking_station'
require 'bike'

describe DockingStation do
  subject(:docking_station) { described_class.new }

  it 'releases a working bike' do
    bike = docking_station.release_bike
    expect(bike).to be_working
  end
end
