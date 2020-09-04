class Bike
  def working?
      true
  end
end

class DockingStation
  attr_reader :bikes
def initialize
  @bikes = []
end


  def release_bike
    fail "There are no bikes" if @bikes.empty?
    @bikes.pop
  end

  def dock_bike(bike)
    fail "The dockingstation is full" if full?
    @bikes << bike
  end

  def full?
    @bikes.length >= 20
  end
  
  def empty?
    @bikes.length < 1
  end
  
end
