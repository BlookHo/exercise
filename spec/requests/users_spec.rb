require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'It works!' do
      get v1_users_path
      expect(response).to have_http_status(200)
    end
  end
end
