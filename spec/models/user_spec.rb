require 'spec_helper'

describe User do
  describe 'Associations' do
    it { should have_many :pastes }
  end

describe 'Validations' do
    it { should validate_presence_of :username}
    it { should ensure_length_of(:username).is_at_most(25)}
    it { should validate_presence_of :password}
  end

  describe 'Authentication' do
    let(:user) { FactoryGirl.create(:user)}

    it 'returns false if password is wrong' do
      user.authenticate("wrong pass").should be false
    end

    it 'returns true if password is correct' do
      user.authenticate("Password").should_not be false
    end
  end
end
