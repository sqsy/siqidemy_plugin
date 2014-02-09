require 'spec_helper'
require 'siqidemy_event'
require 'ostruct'

describe SiqidemyEvent do

  describe "#events" do
    it "defaults to {}" do
      SiqidemyEvent.instance_variable_set(:@events, nil)
      SiqidemyEvent.events.should == {}
    end

    describe "key value" do
      it "defaults to an empty set" do
        SiqidemyEvent.events["event42"].should == Set.new
      end
    end
  end

  describe ".clear" do
    it "clears out events" do
      SiqidemyEvent.events["event42"] << "test event"
      SiqidemyEvent.clear
      SiqidemyEvent.events.should be_empty
    end
  end

  context 'when calling events' do

    let(:harvey) {
      OpenStruct.new(
        name: 'Harvey Dent',
        job: 'District Attorney'
      )
    }

    before do
      SiqidemyEvent.on(:acid_face) do |user|
        user.name = 'Two Face'
      end
    end

    context 'when event does not exist' do

      it "does not raise an error" do
        SiqidemyEvent.trigger(:missing_event)
      end

    end

    context 'when single event exists' do

      it "doesn't raise an error" do
        SiqidemyEvent.trigger(:acid_face, harvey)
      end

      it "changes the name" do
        SiqidemyEvent.trigger(:acid_face, harvey)
        harvey.name.should == 'Two Face'
      end

    end

    context 'when multiple events exist' do

      before do
        SiqidemyEvent.on(:acid_face) do |user|
          user.job =  'Supervillian'
        end

        SiqidemyEvent.trigger(:acid_face, harvey)
      end

      it 'triggers both events' do
        harvey.job.should == 'Supervillian'
        harvey.name.should == 'Two Face'
      end

    end

  end

end
