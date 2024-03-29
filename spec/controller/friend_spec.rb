require 'rails_helper'
#include Devise::Test::ControllerHelpers
# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/friends', type: :request do
  # Post. As you add validations to Post, be sure to
  # adjust the attributes here as well.
  current_user = User.first_or_create!(email: 'dean@example.com', password: 'password', password_confirmation: 'password')

  before do
    sign_in current_user
    @friend = Friend.new(valid_attributes)
    @friend.save
  end

  let(:valid_attributes) do
    {
      'first_name' => 'Atul',
      'last_name' => 'Singh',
      'dob' => '23/08/1990',
      'user_id' => current_user.id,
      'email' => 'atul@gmail.com',
      'phone' => '1122334455'
    }
  end

  let(:invalid_attributes) do
    {
      'first_name' => '',
      'last_name' => '',
      'dob' => '23/08/1990',
      'email' => 'atul',
    }
  end

  describe 'GET /index' do
    it 'has a 200 status code' do
      get friends_url
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /show' do
    it 'has a 200 status code' do
      get friends_url(@friend.id)
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_friend_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      #friend = Friend.new(valid_attributes)
      #friend.save
      get edit_friend_url(@friend.id)
      #print "abcd" + response.inspect
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Friend' do
        expect do
          #friend = Friend.new(valid_attributes)
          #friend.save
          post friends_url, params: { friend: valid_attributes }
        end.to change(Friend, :count).by(1)
      end


=begin
      it 'redirects to the created friend' do
        post friends_url, params: { friend: valid_attributes }
        print response.inspect
        expect(response).to redirect_to(friend_url(@friend.id))
      end
=end


    end

    context 'with invalid parameters' do
      it 'does not create a new Friend' do
        expect do
          post friends_url, params: { friend: invalid_attributes }
        end.to change(Friend, :count).by(0)
      end

=begin
      it "renders a successful response (i.e. to display the 'new' template)" do
        post friends_url, params: { friend: invalid_attributes }
        print response.inspect
        expect(response).to be_successful
      end
=end
    end
  end


=begin
  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          'first_name' => 'Arpit',
          'last_name' => 'Sethi',
          'dob' => '23/08/1991',
          'user_id' => current_user.id,
          'email' => 'arpit@gmail.com',
          'phone' => '5544332211'
        }
      end

      it 'updates the requested friend' do
        patch friend_url(@friend.id), params: { friend: new_attributes }
        @friend.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the post' do
        friend = Friend.new(valid_attributes)
        friend.save
        patch friend_url(friend), params: { friend: new_attributes }
        friend.reload
        expect(response).to redirect_to(friend_url(friend))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        Friend = Friend.create! valid_attributes
        patch friend_url(friend), params: { friend: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end
=end

  describe 'DELETE /destroy' do
    it 'destroys the requested friend' do
      friend = Friend.new(valid_attributes)
      friend.save
      expect do
        delete friend_url(friend)
      end.to change(Friend, :count).by(-1)
    end

    it 'redirects to the friends list' do
      friend = Friend.new(valid_attributes)
      friend.save
      delete friend_url(friend)
      expect(response).to redirect_to(friends_url)
    end
  end




  after do
    sign_out current_user
  end
end
