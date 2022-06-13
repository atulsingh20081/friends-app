require 'rails_helper'

RSpec.describe 'friends/edit', type: :view do
  before(:each) do
    current_user = User.first_or_create!(email: 'dean@example.com', password: 'password', password_confirmation: 'password')
    sign_in current_user
    @friend = assign(:friend, Friend.create!(
      'first_name' => 'Atul',
      'last_name' => 'Singh',
      'dob' => '23/08/1990',
      'user_id' => current_user.id,
      'email' => 'atul@gmail.com',
      'phone' => '1122334455'
    ))
  end

  it 'renders the edit post form' do
    render

    assert_select 'form[action=?][method=?]', friend_path(@friend), 'post' do
      assert_select 'input[name=?]', 'friend[first_name]'
      #assert_select 'input[value=?]', @friend.first_name
      assert_select 'input[value=?]', @friend.last_name
      #assert_select 'input[type=? name=?]','dateselect', 'friend[dob]'
      assert_select 'input[name=?]', 'friend[user_id]'
      assert_select 'input[name=?]', 'friend[email]'
      assert_select 'input[name=?]', 'friend[phone]'
    end
  end
end