require_relative 'bike'

class DockingStation

  def initialize
    @bikes = []
  end

  def release_bike
    raise 'No docked bikes' if empty?

    @bikes.pop
  end

  def dock(bike)
    raise 'Docking Station full' if full?

    @bikes << bike
  end

  private

  def full?
    @bikes.count >= 20
  end

  def empty?
    @bikes.empty?
  end
end
