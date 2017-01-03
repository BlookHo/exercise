require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { FactoryGirl.create(:user, :user_2) }

  describe do
    it 'valid factory' do
      expect(user).to be_valid
    end
  end

  describe 'validation' do

    subject { user }

    it { is_expected.to respond_to(:username) }
    it { is_expected.to respond_to(:email) }
    it { is_expected.to be_valid }

    describe 'username value' do
      before { user.save }
      let(:found_user) { User.find_by(email: user.email) }

      context 'with valid username' do
        it 'username valid' do
          expect(found_user.username).to eq('Mike')
        end
      end
    end

  end

  describe 'username not present' do
    let(:bad_user) { FactoryGirl.build(:user, :no_username) }
    subject { bad_user }
    it { is_expected.not_to be_valid }
  end

  describe 'email not present' do
    let(:bad_user) { FactoryGirl.build(:user, :no_email) }
    subject { bad_user }
    it { is_expected.not_to be_valid }
  end

  describe 'emails format' do
    let(:user) { User.new(username: 'Example User2', email: 'user@example.com') }
    subject { user }

    describe 'email format is invalid' do
      it 'should be invalid' do
        addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
        addresses.each do |invalid_address|
          user.email = invalid_address
          expect(user).not_to be_valid
        end
      end
    end

    describe 'email format is valid' do
      it 'should be valid' do
        addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
        addresses.each do |valid_address|
          user.email = valid_address
          expect(user).to be_valid
        end
      end
    end

    describe 'email address is already taken' do
      before do
        user_with_same_email = user.dup
        user_with_same_email.email = user.email.upcase
        user_with_same_email.save
      end
      it { is_expected.not_to be_valid }
    end

    describe 'email address with mixed case' do
      let(:mixed_case_email) { 'Foo@ExA6k6MPle.CoM' }

      it 'should be saved as all lower-case' do
        user.email = mixed_case_email
        user.save
        expect(user.reload.email).to eq mixed_case_email.downcase
      end
    end

  end
end
