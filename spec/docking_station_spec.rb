require 'docking_station'
require 'bike'

describe DockingStation do
  subject(:docking_station) { described_class.new }

  describe '#release_bike' do
    context 'docking station has a docked bike' do
      it 'releases a bike' do
        bike = Bike.new
        subject.dock(bike)

        expect(bike).to be_working
      end
    end

    context 'docking station does not have a docked bike' do
      it 'raises error' do
        expect { docking_station.release_bike }.to raise_error('No docked bikes')
      end
    end
  end

  describe '#dock' do
    context 'docking station has space' do
      it 'returns the docked bike' do
        bike = Bike.new
        subject.dock(bike)

        expect(docking_station.release_bike).to eq bike
      end
    end

    context 'docking station is at capacity' do
      it '#dock raises an error' do
        docking_station.capacity.times { docking_station.dock(Bike.new) }

        expect { docking_station.dock(Bike.new) }.to raise_error 'Docking Station full'
      end
    end
  end

  it 'is initialized with a defualt capacity' do
    expect(docking_station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end
end
