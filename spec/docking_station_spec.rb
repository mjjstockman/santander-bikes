require 'docking_station'
require 'bike'

describe DockingStation do
  subject(:docking_station) { described_class.new }

  it 'releases a working bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(bike).to be_working
  end

  it '#release_bike raises error if no bike is docked' do
    expect { docking_station.release_bike }.to raise_error('No docked bikes')
  end

  it '#release_bike returns the docked bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(docking_station.release_bike).to eq bike
  end
end
