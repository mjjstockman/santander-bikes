require 'docking_station'
require 'bike'

describe DockingStation do
  subject(:docking_station) { described_class.new }

  describe '#release_bike' do

    it 'releases a working bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(bike).to be_working
    end

    it 'raises error if no bike is docked' do
      expect { docking_station.release_bike }.to raise_error('No docked bikes')
    end

    it 'returns the docked bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(docking_station.release_bike).to eq bike
    end

    it 'can dock 20 bikes' do
      expect{ 20.times { docking_station.dock(Bike.new) }}.not_to raise_error
    end

    it 'errors if try to dock over 20 bikes' do
      20.times { docking_station.dock(Bike.new) }
      expect{ docking_station.dock(Bike.new) }.to raise_error
    end

  end
end
