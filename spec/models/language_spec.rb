require 'spec_helper'

describe Language do
  describe 'Associations' do
    it { should have_many :pastes }
  end
end
