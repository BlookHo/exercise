require 'rails_helper'

RSpec.describe GroupEvent, type: :model do

  after { GroupEvent.reset_pk_sequence }
  describe do
    let(:group_event_new) { FactoryGirl.create(:group_event) }
    it 'has a valid factory' do
      expect(group_event_new).to be_valid
    end

    subject { group_event_new }

    it { is_expected.to respond_to(:user_id) }
    it { is_expected.to respond_to(:start) }
    it { is_expected.to respond_to(:stop) }
    it { is_expected.to respond_to(:duration) }
    it { is_expected.to respond_to(:name) }

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

    it { is_expected.not_to be_valid }

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
    before { GroupEvent.reset_pk_sequence }

    context 'no fields == nil - can publish' do
      before { FactoryGirl.create(:group_event, :group_event_to_publish) }
      let(:group_event_publish) { GroupEvent.first }

      it ' no fields have nil - can publish' do
        group_event_publish.publish_event
        puts 'no fields == nil'
        puts "group_event - .published = #{group_event_publish.published.inspect}"
        expect(group_event_publish.published).to eq(true)
      end
    end

    context 'one field (description) == nil - can not publish' do
      before { FactoryGirl.create(:group_event, :can_not_publish_one_nil) }
      let(:group_event_publish) { GroupEvent.first }

      it ' one field have nil - can not publish' do
        group_event_publish.publish_event
        puts 'one field == nil'
        puts "group_event - .published = #{group_event_publish.published.inspect}"
        expect(group_event_publish.published).to_not eq(true)
      end
    end

  end

  describe 'check deletion mark' do
    before { GroupEvent.reset_pk_sequence }
    context 'delete' do
      before { FactoryGirl.create(:group_event, :group_event_to_remove) }
      let(:group_event_delete) { GroupEvent.first }

      it ' mark deleted' do
        group_event_delete.delete_event
        puts "group_event - deleted = #{group_event_delete.deleted.inspect}"
        expect(group_event_delete.deleted).to eq(true)
      end
    end

  end

end
