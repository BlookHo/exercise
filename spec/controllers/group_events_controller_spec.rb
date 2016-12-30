require 'rails_helper'

RSpec.describe Api::V1::GroupEventsController, type: :controller do

  let(:valid_attributes) { { id: 3, user_id: 2, start: '2017-02-15T10:00:00.000Z',
                             stop: '2017-02-25T18:00:00.000Z', duration: 10,
                             name: 'Weekend', description: 'Great weekend for the whole team',
                             markdown_description: nil, location: 'Paris',
                             published: true, deleted: true }
  }

  describe "GET #index" do
    it "assigns all group_events as @group_events" do
      group_event = GroupEvent.create! valid_attributes
      get :index, params: {}
      expect(assigns(:group_events)).to eq([group_event])
    end
  end

  describe "GET #show" do
    it "assigns the requested group_event as @group_event" do
      group_event = GroupEvent.create! valid_attributes
      get :show, params: {id: group_event.to_param}
      expect(assigns(:group_event)).to eq(group_event)
    end
  end

  describe "GET #remove" do

    before do
      FactoryGirl.create(:group_event, :group_event_to_remove)
      puts "Before: :deleted = #{GroupEvent.find(2).deleted}"
    end

    let(:group_event) { GroupEvent.find(2) }
    it 'change :deleted from false to true - mark event as removed' do
      get :remove, params: {id: 2}
      puts "After remove: ['deleted_event']['deleted'] = #{JSON.parse(response.body)['deleted_event']['deleted']}"
      expect(JSON.parse(response.body)['deleted_event']['deleted']).to eq(true)
    end

  end

  describe "GET #publish" do
    before do
      puts "Before: :count = #{GroupEvent.all.count}"
      FactoryGirl.create(:group_event, :group_event_to_publish)
      puts "Before: :count = #{GroupEvent.all.count}"
      puts "Before: :published = #{GroupEvent.find(3).inspect}"
    end

    let(:group_event) { GroupEvent.find(3) }
    it 'change :published from false to true - mark event as removed' do
      get :publish, params: {id: 3}
      puts "After publish:  = #{JSON.parse(response.body)}"
      puts "After publish: ['published_event']['published'] = #{JSON.parse(response.body)['published_event']['published']}"
      expect(JSON.parse(response.body)['published_event']['published']).to eq(true)
     end

   end
end
