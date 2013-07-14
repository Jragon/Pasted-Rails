require 'spec_helper'

describe PastesController do
  describe '#create' do
    context 'User logged in' do
      before { 
        FactoryGirl.create(:user)
        session['user_id'] = 1
      }

      it 'creates a paste with user_id of 1' do
        post :create, paste: { content: 'lorem ipsum', name: 'lor' }

        Paste.first.user_id.should == 1
      end
    end

    context 'Anonymous user' do
      it 'creates a paste with a user_id of nil' do
        post :create, paste: { content: 'lorem ipsum', name: 'lor' }

        Paste.first.user_id.should == nil
      end
    end
  end
end
