require 'docking_station'

describe DockingStation do
  it 'docks a bike' do
    ds = DockingStation.new
    bike = Bike.new
    ds.dock(bike)
  end
end
