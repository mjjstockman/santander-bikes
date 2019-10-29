require 'docking_station'
require 'bike'

describe 'User Stories' do
  let(:docking_station) { DockingStation.new }
  let(:bike) { Bike.new }

  describe '#release_bike' do
    context 'docking station has a bike' do
      it 'releases a bike' do
        docking_station.dock(bike)

        expect(docking_station.release_bike).to eq bike
      end
    end

    context 'docking station is empty' do
      it 'raises an error' do
        expect { docking_station.release_bike }.to raise_error 'No docked bikes'
      end
    end
  end

  it '#working? returns a boolean' do
    expect(bike).to be_working
  end

  describe '#dock' do
    context 'docking station is at capacity' do
      it 'raises an error' do
        DockingStation::DEFAULT_CAPACITY.times { docking_station.dock(bike) }

        expect { docking_station.dock(bike) }.to raise_error 'Docking Station full'
      end
    end
  end

  describe 'Docking Stations' do
    context 'no capacity given at initialization' do
      it 'is initialized with a defualt capacity' do
        expect(docking_station.capacity).to eq DockingStation::DEFAULT_CAPACITY
      end
    end

    context 'capacity given at initialization' do
      it 'overwrites default capacity' do
        ds = DockingStation.new(30)

        expect(ds.capacity).to eq 30
      end
    end
  end
end

# As a member of the public
# So I can decide whether to use the docking station
# I want to see a bike that has been docked

# ^^^^^ cant test as using a private method ^^^^^

# it 'returns a docked bike' do
#   ds = DockingStation.new
#   bike = Bike.new
#   ds.dock(bike)
#   expect(ds.bikes).to include bike
# end

# ^^^^^ test if was public method ^^^^^

# As a member of the public,
# So that I am not confused and charged unnecessarily,
# I'd like docking stations not to release bikes when there are none available.
