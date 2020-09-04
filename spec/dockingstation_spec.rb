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
    it { is_expected.to be_an_instance_of(Bike) }
  end
  it ".bike is a bike" do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.bikes).to eq bike
  end
  describe "#release_bike" do
    it 'raises an error when there are no bikes' do
      expect { subject.release_bike}.to raise_error "There are no bikes"
    end
  end
  describe '#dock' do
    it "raises an error when dock is full" do
      subject.dock_bike(Bike.new)
      expect {subject.dock_bike(Bike.new)}.to raise_error "The dockingstation is full"
    end
  end
end
