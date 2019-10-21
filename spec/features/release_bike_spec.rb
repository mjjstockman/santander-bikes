require 'docking_station'
require 'bike'

describe DockingStation do
  subject(:docking_station) { described_class.new }

  it 'releases a bike' do
    bike = Bike.new
    docking_station.dock(bike)
    docking_station.release_bike
  end

  it 'has bikes which work' do
    bike = Bike.new
    bike.working?
  end

  it '#release_bike raises error if no docked bike' do
    expect(docking_station.release_bike).to raise_error 'No docked bikes'
  end
end
