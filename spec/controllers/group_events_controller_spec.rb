require 'rails_helper'

RSpec.describe Api::V1::GroupEventsController, type: :controller do

  let(:valid_attributes) { { user_id: 2, start: '2017-02-15T10:00:00.000Z',
                             stop: '2017-02-25T18:00:00.000Z', duration: 10,
                             name: 'Weekend', description: 'Great weekend for the whole team' }
  }
  before { GroupEvent.reset_pk_sequence }

  describe 'GET #index' do
    it "assigns group_events" do
      group_event = GroupEvent.create! valid_attributes
      get :index, params: {}
      expect(assigns(:group_events)).to eq([group_event])
    end
  end

  describe 'GET #show' do
    it 'assigns group_event' do
      group_event = GroupEvent.create! valid_attributes
      get :show, params: {id: group_event.to_param}
      expect(assigns(:group_event)).to eq(group_event)
    end
  end

  describe 'DELETE #remove' do
    before do
      FactoryGirl.create(:group_event, :group_event_to_remove)
      puts "\nBefore :remove: :deleted = #{GroupEvent.first.deleted}"
    end

    let(:group_event) { GroupEvent.first }
    it ' mark event as removed' do
      get :remove, params: {id: 1}
      puts "After :remove: 'deleted' = #{JSON.parse(response.body)['deleted_event']['deleted']}"
      expect(JSON.parse(response.body)['deleted_event']['deleted']).to eq(true)
    end

  end

  describe 'PUT #publish' do
    before do
      FactoryGirl.create(:group_event, :group_event_to_publish)
      puts "\nBefore :publish: :published = #{GroupEvent.first.published}"
    end

    let(:group_event) { GroupEvent.first }
    it ' mark event as published' do
      get :publish, params: {id: 1}
      puts "After :publish: :published = #{GroupEvent.first.published}"
      expect(JSON.parse(response.body)['published_event']['published']).to eq(true)
     end

   end
end
