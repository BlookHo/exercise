require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do

  let(:valid_attributes) { { username: 'Example_User', email: 'user@example.com' } }

  describe 'GET #index' do
    it 'assigns all users as @users' do
      user = User.create! valid_attributes
      get :index, params: {}
      expect(assigns(:users)).to eq([user])
    end  end

  describe 'GET #show' do :index
    it 'assigns the requested user as user' do
      user = User.create! valid_attributes
      get :show, params: {id: user.to_param}
      expect(assigns(:user)).to eq(user)
    end
  end

end
