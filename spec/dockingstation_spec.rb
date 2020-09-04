require 'boris_classes'

describe DockingStation do

  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock_bike) }

  it 'Checks to see if the bike is working' do
  station = DockingStation.new
  station.dock_bike(Bike.new)
  expect(station.release_bike.working?).to eq true
  end
  
  describe (DockingStation.new).dock_bike(Bike.new) do
    it { is_expected.to be_an_instance_of(Array) }
  end
  it ".bike is a bike" do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.bikes).to eq [bike]
  end



  describe "#release_bike" do
    it 'raises an error when there are no bikes' do
      expect { subject.release_bike}.to raise_error "There are no bikes"
    end
  end
  describe '#dock' do
    it "raises an error when dock is full" do
     # subject.dock_bike(Bike.new)
      expect {(DockingStation::DEFAULT_CAPACITY + 1).times {subject.dock_bike(Bike.new)}}.to raise_error "The dockingstation is full"
    end

    it "doesn't raise an error for 20 bikes" do
      expect {DockingStation::DEFAULT_CAPACITY.times {subject.dock_bike(Bike.new)}}.not_to raise_error "The dockingstation is full"
    end
  end
  it 'takes an argumenent for the bike capacity' do
    station = DockingStation.new(30)
    expect(station.capacity).to eq 30
  end
  it 'sets the default vaule of capacity to 20' do
    station = DockingStation.new
    expect(station.capacity).to eq 20
  end
  #it "allows 20 bikes" do
   # dock = DockingStation.new
  #  expect {20.times {dock.dock_bike(Bike.new)} }.not_to raise_error ""
end

describe Bike do
  describe 'a method that asks if a bike is working' do
      it 'responds to the method "working?"' do
          bike = Bike.new
          expect(bike).to respond_to(:working?)
      end

      
  end
  it {is_expected.to respond_to(:report_broken)}
  describe 'working' do
      
      it 'returns true if bike is working' do
          bike = Bike.new
          expect(bike.working?).to eq true
      end
      it "returns broken when bike is broken" do
        bike = Bike.new
        bike.report_broken
        expect(bike.working?).to eq false
      end
  end
end