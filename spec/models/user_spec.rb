require 'rails_helper'

RSpec.describe User, type: :model do

  describe do
    let(:user) { FactoryGirl.create(:user) }
    it 'has a valid factory' do
      expect(user).to be_valid
    end
  end

  describe 'validation of model User' do
    before { @user = User.new(username: 'Example User', email: 'user@example.com') }

    subject { @user }
    it { should respond_to(:username) }
    it { should respond_to(:email) }
    it { should be_valid }

    describe 'return value of authenticate method' do
      before { @user.save }
      let(:found_user) { User.find_by(email: @user.email) }

      describe 'with valid username' do
        it 'username should be valid' do
          expect(found_user.username).to eq('Example User')
        end
      end
    end

  end

  describe 'when email is not present' do
    before { @user = User.new(username: 'Example User', email: ' ') }
    it { should_not be_valid }
  end
  describe 'when username is not present' do
    before { @user = User.new(username: ' ', email: 'user@example.com') }
    it { should_not be_valid }
  end
  describe 'when username is too long' do
    before { @user = User.new(username: 'a' * 51, email: 'user@example.com') }
    it { should_not be_valid }
  end
  describe 'when email have more than one dot' do
    before { @user = User.new(username: 'Example User', email: 'user@ex.ample.com') }
    it { should_not be_valid }
  end
  describe 'when email have more than one dot' do
    before { @user = User.new(username: 'Example User', email: 'u.ser@example.com') }
    it { should_not be_valid }
  end

  describe 'check emails format' do

    before { @user = User.new(username: 'Example User2', email: 'user@example.com') }
    subject { @user }

    describe 'when email format is invalid' do
      it 'should be invalid' do
        addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
        addresses.each do |invalid_address|
          @user.email = invalid_address
          expect(@user).not_to be_valid
        end
      end
    end

    describe 'when email format is valid' do
      it 'should be valid' do
        addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
        addresses.each do |valid_address|
          @user.email = valid_address
          expect(@user).to be_valid
        end
      end
    end

    describe 'when email address is already taken' do
      before do
        user_with_same_email = @user.dup
        user_with_same_email.email = @user.email.upcase
        user_with_same_email.save
      end
      it { should_not be_valid }
    end

    describe 'email address with mixed case' do
      let(:mixed_case_email) { 'Foo@ExA6k6MPle.CoM' }

      it 'should be saved as all lower-case' do
        @user.email = mixed_case_email
        @user.save
        expect(@user.reload.email).to eq mixed_case_email.downcase
      end
    end

  end
end
