require_relative 'bike'

class DockingStation
  attr_reader :bike

  def release_bike
    # Bike.new
    raise 'No docked bikes' unless @bike

    @bike
  end

  def dock(bike)
    raise 'Docking Station full' if @bike

    @bike = bike
  end
end
