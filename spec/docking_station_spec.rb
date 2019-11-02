require 'docking_station'

describe DockingStation do
  subject(:docking_station) { described_class.new }
  let(:bike) { double('bike') }

  describe '#release_bike' do
    context 'docking station has a docked bike' do
      it 'releases a bike' do
        docking_station.dock(bike)
        allow(bike).to receive(:working?).and_return(true)

        expect(bike).to be_working
      end
    end

    context 'docking station does not have a docked bike' do
      it 'raises error' do
        expect { docking_station.release_bike }.to raise_error('No docked bikes')
      end
    end

    context 'does not release a broken bike' do
      it 'raises an error' do
        docking_station.dock(bike)

        allow(bike).to receive(:working?).and_return(false)

        expect { docking_station.release_bike }.to raise_error 'No working bikes'
      end
    end
  end

  describe '#dock' do
    context 'docking station has space' do
      it 'returns the docked bike' do
        docking_station.dock(bike)

        allow(bike).to receive(:working?).and_return(true)

        expect(docking_station.release_bike).to eq bike
      end
    end

    context 'docking station is at capacity' do
      it '#dock raises an error' do
        docking_station.capacity.times { docking_station.dock(bike) }

        expect { docking_station.dock(bike) }.to raise_error 'Docking Station full'
      end
    end
  end

  it 'is initialized with a defualt capacity' do
    expect(docking_station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end
end
