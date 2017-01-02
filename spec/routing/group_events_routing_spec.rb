require "rails_helper"

RSpec.describe Api::V1::GroupEventsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/v1/group_events").to route_to("api/v1/group_events#index")
    end

    it "routes to #create" do
      expect(:post => "/v1/group_events").to route_to("api/v1/group_events#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/v1/group_events/1").to route_to("api/v1/group_events#update", :id => "1")
    end

    it "routes to #remove" do
      expect(:delete => "/v1/remove?id=2").to route_to("api/v1/group_events#remove", :id => '2')
    end

    it "routes to #publish" do
      expect(:put => "/v1/publish?id=2").to route_to("api/v1/group_events#publish", :id => '2')
    end

  end
end
