class Bike
  def working?
      true
  end
end

class DockingStation
  attr_reader :bikes

  def release_bike
    fail "There are no bikes" unless @bikes
    @bikes
  end

  def dock_bike(bike)
    fail "The dockingstation is full" if @bikes
    @bikes = bike
  end
end
