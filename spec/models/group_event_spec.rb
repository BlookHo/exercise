require 'rails_helper'

RSpec.describe GroupEvent, type: :model do

  describe do
    let(:group_event) { FactoryGirl.create(:group_event) }
    it 'has a valid factory' do
      expect(group_event).to be_valid
    end
  end

  describe 'validation of Valid model GroupEvent' do
    before { @group_event = GroupEvent.new(
      "user_id": 2,
      "start": '2017-01-12T22:00:00.000Z',
      "stop": '2017-01-14T22:00:00.000Z',
      "duration": 2,
      "name": 'Weekend',
      "description": 'Winter Weekend - my_email@sds.com End ',
      "location": "Bern")
    }

    subject { @group_event }
    it { should respond_to(:user_id) }
    it { should respond_to(:start) }
    it { should respond_to(:stop) }
    it { should respond_to(:duration) }
    it { should respond_to(:name) }
    it { should be_valid }
  end

  describe 'when stop time is less than start time' do
    let(:group_event_stop_less_start) { FactoryGirl.build(:group_event, :event_stop_less_start) }
     it 'group_event_stop_less_start' do
       expect(group_event_stop_less_start).to_not be_valid
     end
  end

  describe 'when start time is less than current time' do
    let(:group_event_start_less_current) { FactoryGirl.build(:group_event, :event_start_less_current) }
    subject { group_event_start_less_current }
    it { should_not be_valid }
  end

  describe 'value stop time having start and duration before save' do
    let(:group_event_value_stop_time) { FactoryGirl.build(:group_event, :event_value_stop_time) }
    let(:valued_stop_time) { group_event_value_stop_time.value_stop_time }
    it ' - value stop time' do
      puts "start time = #{group_event_value_stop_time.start}"
      puts "duration = #{group_event_value_stop_time.duration}"
      puts "valued stop time = #{valued_stop_time}"
      expect(valued_stop_time).to eq('2017-01-10 10:00:00')
    end
  end

  describe 'check publish: can not publish when fields are nil' do

    describe 'no fields == nil - can publish' do
      before { FactoryGirl.create(:group_event, :group_event_to_publish) }
      let(:group_event_publish) { GroupEvent.find(3) }
      let(:after_event_can_not_publish) { group_event.publish_event }

      it ' no fields == nil - can publish' do
        group_event_publish.publish_event
        puts '1. no fields == nil'
        puts "group_event - .published = #{group_event_publish.published.inspect}"
        expect(group_event_publish.published).to eq(true)
      end
    end

  end

end
