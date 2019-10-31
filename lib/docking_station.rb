require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise 'No docked bikes' if empty?
    raise 'No working bikes' if working_bikes.empty?

    bikes.pop
  end

  def dock(bike)
    raise 'Docking Station full' if full?

    bikes << bike
  end

  def working_bikes
    working_bikes = []
    bikes.each do |bike|
      working_bikes << bike if bike.working?
    end
    working_bikes
  end

  private

  attr_reader :bikes

  def full?
    bikes.count >= capacity
  end

  def empty?
    bikes.empty?
  end
end
