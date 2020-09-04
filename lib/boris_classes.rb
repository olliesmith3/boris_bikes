class Bike
  attr_reader :working
  def initialize
      @working = true
  end

  def report_broken 
    @working = false 
  end

  def working?
      @working
  end
end

class DockingStation
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
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

  private

  def full?
    @bikes.length >= DEFAULT_CAPACITY
  end
  
  def empty?
    @bikes.length < 1
  end
  
end


