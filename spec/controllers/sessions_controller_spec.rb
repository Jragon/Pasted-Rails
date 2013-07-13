require 'spec_helper'

describe SessionsController do
  describe 'login (#create)' do
    before(:each)  { FactoryGirl.create(:user) }

    context 'correct password' do
      it 'set user_id to user if password is correct' do
        post :create, username: 'Username', password: 'Password'

        session['user_id'].should == 1
      end

      it 'redirects to root_url' do
        post :create, username: 'Username', password: 'Password'

        response.should redirect_to root_url
      end
    end

    context 'incorrect password' do
      it 'flashs an alert telling the user their info is incorrect' do     
        post :create, username: 'Username', password: 'incorrect'

        flash[:alert].should == 'Username or Password incorrect'
      end

      it 'redirects to login_url' do
        post :create, username: 'Username', password: 'incorrect'

        response.should redirect_to login_url
      end
    end
  end

  describe 'logout (#destroy)' do
    before(:each) { session['user_id'] = 1 }

    it 'sets user_id to nil, logging the user out' do
      get :destroy

      session['user_id'].should == nil
    end

    it 'redirects to root_url' do
      get :destroy

      response.should redirect_to root_url
    end
  end
end
