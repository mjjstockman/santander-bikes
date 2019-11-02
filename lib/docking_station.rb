require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :capacity, :bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise 'No docked bikes' if empty?
    raise 'No working bikes' if no_working_bikes?

    bikes.pop
  end

  def dock(bike)
    raise 'Docking Station full' if full?

    bikes << bike
  end

  # make method to get array of working bikes
  def working_bikes
    working_bikes = []
    bikes.each do |bike|
      working_bikes << bike if bike.working?
    end
    working_bikes
  end
  # make method to get array of broken bikes

  def broken_bikes
    broken_bikes = []
    bikes.each do |bike|
      broken_bikes << bike unless bike.working?
    end
    broken_bikes
  end

  private

  def full?
    bikes.count >= capacity
  end

  def empty?
    bikes.empty?
  end

  def no_working_bikes?
    working_bikes = []
    bikes.each do |bike|
      working_bikes << bike if bike.working?
    end
    working_bikes.empty?
  end


end
