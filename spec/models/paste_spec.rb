require 'spec_helper'

describe Paste do
  describe 'Associations' do
    it { should belong_to :language }
  end

  describe 'Validations' do
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:name) }
  end
end
