require 'rails_helper'

RSpec.describe 'GroupEvents', type: :request do
  describe 'GET /group_events' do
    it 'It works!' do
      get v1_group_events_path
      expect(response).to have_http_status(200)
    end
  end
end
