require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(:get => '/v1/users').to route_to('api/v1/users#index')
    end

    it 'routes to api/v1/users#show' do
      expect(:get => '/v1//users/1').to route_to('api/v1/users#show', :id => '1')
    end

  end
end
