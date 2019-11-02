require_relative 'docking_station'
require_relative 'bike'

class Van
  def collect_broken_bikes(docking_station)
    docking_station.broken_bikes
  end
end
